class User < ActiveRecord::Base
  has_and_belongs_to_many :expenses, inverse_of: :members
  has_and_belongs_to_many :projects, inverse_of: :members
  has_many :payments, class_name: "Expense", foreign_key: "user_id", inverse_of: :payer

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_encrypted :authentication_token, :key => ENV['TOKEN_KEY']
  before_save :ensure_authentication_token

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def reset_authentication_token!
    self.authentication_token = generate_authentication_token
    self.save
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.find_by_authentication_token(token)
    end
  end
end
