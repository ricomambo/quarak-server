# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Project < ActiveRecord::Base
  has_many :expenses, inverse_of: :project
  has_and_belongs_to_many :members, class_name: "User", inverse_of: :projects
  has_many :settlements

  validates :title, :members, presence: true

  def to_s
    "Project ##{self.id}"
  end
end
