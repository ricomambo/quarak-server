class Project < ActiveRecord::Base
  has_many :expenses, inverse_of: :project
  has_and_belongs_to_many :members, class_name: "User", inverse_of: :projects

  validates :title, :members, presence: true
end
