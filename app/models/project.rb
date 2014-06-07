class Project < ActiveRecord::Base
  has_many :expenses
  has_and_belongs_to_many :members, class_name: "User"
end
