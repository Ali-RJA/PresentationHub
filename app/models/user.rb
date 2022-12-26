class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :presentations
  has_many :feedbacks

  # Deactivate a user to prevent logins
  def deactivate
    update_attribute :active, false
  end

  def active_for_authentication?
    self.active?
  end
end
