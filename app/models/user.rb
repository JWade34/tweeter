class User < ActiveRecord::Base

  has_secure_password validations: false
  has_many :posts

  acts_as_followable
  acts_as_follower

  validates :name, presence: true, uniqueness: true, :if => :active_or_login?
  validates :password, confirmation: true, :if => :active_or_login?
  validates :facebook, presence: true, :if => :active_or_personal?
  validates :email, presence: true, uniqueness: true, :if => :active_or_personal?

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
