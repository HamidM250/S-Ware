class Volunteer < ActiveRecord::Base
  attr_accessible :address, :background, :dob, :email, :firstname, :home, :lastname, :moblie, :title
  
  :validates :title, :presence => true
  :validates :dob, :presence => true
  :validates :firstname, :presence => true
  :validates :lastname, :presence => true
  :validates :address, :presence => true
  :validates :email, :presence => true
  
  #We only want one of these 2 to be required
  :validates :moblie, :presence => true
  :validates :home, :presence => true
  
  :validates :background, :presence => true
  
  has_many :whiteboards
end
