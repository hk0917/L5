class Tweet < ApplicationRecord
  belongs_to :user

  # 削除伝搬を追加（ツイートを消すと関連するいいねも消える）
  has_many :likes, dependent: :destroy
  has_many :like_users, source: :user, through: :likes

  # いいね用メソッドのモジュール化
  def like(user)
    likes.create(user_id: user.id)
  end

  def unlike(user)
    likes.find_by(user_id: user.id)&.destroy
  end

  def liked?(user)
    like_users.include?(user)
  end
end