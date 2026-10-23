class User < ApplicationRecord
  has_secure_password

  validates :uid, presence: true, uniqueness: true

  has_one :profile
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_tweets, through: :likes, source: :tweet

  def like(tweet)
    likes.create(tweet_id: tweet.id)
  end

  def unlike(tweet)
    likes.find_by(tweet_id: tweet.id)&.destroy
  end

  def liked?(tweet)
    like_tweets.include?(tweet)
  end
end