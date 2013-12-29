require 'net/smtp'

class Volunteer < ActiveRecord::Base

  attr_accessible :id, :address, :background, :dob, :email, :firstname, :home, 
            :lastname, :mobile, :title, :orientation_id, :befosterer, :status,
            :break_from, :break_to,  :vol_job_day_attributes,
            :ondays_attributes, :jobdescriptions_attributes, :role, :user_id, :orientation_id,
            :volscheduler_id

  has_many :whiteboards
  has_one  :fosterer
  belongs_to :user
    accepts_nested_attributes_for :user
  belongs_to :orientation
  
  validates  :role, :presence => true
  #validates :title, :presence => true #, :message => ""

  validates :dob, :presence => true
  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates :address, :presence => true
  validates :email, :presence => true
  validates :status, :presence => true
  #validates :background, :presence => true
 ## validate  :breakdate_validator#, 
            #:unless => (:break_from.nil? && :break_to.nil?)
#  validates_associated :vol_job_days  

  #We want to only require one of these two

 ## validates :moblie, :numericality => {:only_integer => true},
 ##                    :presence => true, :if => "home.blank?"
 ## validates :home, :numericality => {:only_integer => true},
  ##                 :presence => true, :if => "moblie.blank?"

  #There is a bug atm - if one of them is there, it doesn't
  #check that the other one is numerical. Don't care atm!
  
  validate :orientation_selected
  validate :orientation_not_full
  
  validate :over_18_validator
  
  after_save :send_confirmation_email

##############################################################

  def over_18_validator
    if dob + 18.years >= Date.today
      errors.add(:dob, "can't be under 18")
    end
  end

  def orientation_selected
    if orientation_id == nil
      errors.add(:orientation_id, "must be selected")
    end
  end

  def orientation_not_full
    if orientation.numCurrParticipant >= orientation.participantMax
      errors.add(:orientation, "is full")
    end
  end

  def test_email_confirmation_message
    return send_confirmation_email
  end

  # precondition: after_save callback only triggers on a successfull save
  private
  def send_confirmation_email
    vc = Volcoordinator.find(:first)

    message = <<-MESSAGE_END
    From: #{defined?(vc.email_replyto).nil? ? 'test from' : vc.email_replyto }
    To: #{email.nil? ? 'test to' : email}
    Subject: #{defined?(vc.application_email_header).nil? ? 
                          'test header' : vc.application_email_header}
    #{defined?(vc.application_email_content).nil? ? 
                          'test content' : vc.application_email_content}
    
    MESSAGE_END

 #   Net::SMTP.start('mail.ecs.vuw.ac.nz',
 #                    587,
 #                   'localhost',
 #                   'stevenmatt3', 'password', :plain ) do |smtp|
 #     smtp.send_message message, vc.email_replyto,
 #                                'stevenmatt3@myvuw.ac.nz',
 #                                'test@gmail.com'


    # puts an email sent message on the server terminal
    puts "\n******************************************"
    puts "************* email sent"
    puts message

    return message # used in test
#    end
  end
end