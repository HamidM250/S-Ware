class DeptSupervisor < ActiveRecord::Base
  attr_accessible :department_id, :firstname, :lastname, :title

  belongs_to :department
  belongs_to :user

end
