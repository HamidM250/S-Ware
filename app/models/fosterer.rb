class Fosterer < ActiveRecord::Base
  attr_accessible :city, :email, :firstname, :lastname, :street, :unitNumber, :streetNumber, :suburb, :unitNumber, :zipCode, :homecontact, :mobilecontact, :workcontact,
		  :theirname, :mobilecontact2, :homecontact2, :workcontact2, :relationship, :kitcat, :p1, :p2, :p31,:p32, :p33, :p34, :p35, :p36, :p4, :p51, :p52, :p53,
		  :personal1, :personal1if, :personal2, :personal3, :personal4, :personal5
      
  
   validates :firstname, :presence => true
  
  validates :lastname, :presence => true
  
  validates :streetNumber, :presence => true
  validates :street, :presence => true
  validates :suburb, :presence => true
  validates :city, :presence => true
  validates :zipCode, :presence => true
 
 
 
  
end
