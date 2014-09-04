# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string(255)      default(""), not null
#  password   :string(255)      default(""), not null
#  name       :string(255)
#  token      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_and_belongs_to_many :expenses, inverse_of: :members
  has_and_belongs_to_many :projects, inverse_of: :members
  has_many :payed_expenses,    class_name: "Expense",    foreign_key: "payer_id", inverse_of: :payer
  has_many :payed_settlements, class_name: 'Settlement', foreign_key: 'payer_id', inverse_of: :payer
  has_many :received_settlements, class_name: 'Settlement', foreign_key: 'payee_id', inverse_of: :payee

  validates_presence_of :email, :password
  validates_uniqueness_of :email

  before_save :ensure_token

  def self.authenticate(email, password)
    user = find_by_email(email)
    logger.debug password
    logger.debug user.password
    logger.debug BCrypt::Password.new(user.password)
    if user && BCrypt::Password.new(user.password) == password
      user.reset_token!
      user
    else
      nil
    end
  end

  def password=(secret)
    write_attribute(:password, BCrypt::Password.create(secret))
  end

  def ensure_token
    if token.blank?
      self.token = generate_token
    end
  end

  def reset_token!
    self.token = generate_token
    self.save
  end

  def balances
    balances = []
    self.projects.each do |project|
      balances << Balance.new(project, self)
    end
    balances
  end

  private

  def generate_token
    loop do
      token = SecureRandom.urlsafe_base64(nil, false)
      break token unless User.find_by_token(token)
    end
  end
end
