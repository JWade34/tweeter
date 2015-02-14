class User < ActiveRecord::Base
  has_many :posts
  has_secure_password validations: false

  validates :name, presence: true, uniqueness: true, :if => :active_or_login?
  validates :password, confirmation: true, :if => :active_or_login?
  # personal step
  validates :email, presence: true, :if => :active_or_personal?
  validates :facebook, presence: true, :if => :active_or_personal?

  def active?
    status == 'active'
  end

  def active_or_login?
    status.include?('login') || active?
  end

  def active_or_personal?
    status.include?('personal') || active?
  end
end
