class Post < ActiveRecord::Base
  belongs_to :user
  validates :user, :body, presence: true
  paginates_per 10

  

end
