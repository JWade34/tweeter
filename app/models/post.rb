class Post < ActiveRecord::Base
  belongs_to :user
  validates :user, :body, presence: true
  paginates_per 4

  def self.timeline(user)
    follower_ids = user.following_users.map(&:id)
    all_ids= follower_ids << user.id
    Post.where(user_id: all_ids).order("created_at DESC")
  end

end
