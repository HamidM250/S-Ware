class Fosterer < ActiveRecord::Base
  attr_accessible :personal2, :catnursing, :catfeeding, :catbottlefeed, :catinjured, 
		:dognursing, :dogfeeding, :dogbottlefeed, :doginjured,
		:rabgui, :hedgehoginjured, :hedgehogbottle, :birdsinjured, :birdstoung, :livestock
      
  
end
