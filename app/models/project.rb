class Project < ActiveRecord::Base
  has_many :expenses, inverse_of: :project
  has_and_belongs_to_many :members, class_name: "User", inverse_of: :projects
  has_many :settlements

  validates :title, :members, presence: true

  def to_s
    "Project ##{self.id}"
  end

  def balances
    balances = []
    self.members.each do |member|
      balances << Balance.new(self, member)
    end
    balances
  end
end
