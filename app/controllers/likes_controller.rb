class LikesController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    # 「いいね」してなかったら「いいね」する
    unless tweet.liked?(current_user)
      tweet.like(current_user)
    end
    redirect_to root_path
  end

  def destroy
    tweet = Tweet.find(params[:id])
    # 「いいね」してたら「いいね」を消す
    if tweet.liked?(current_user)
      tweet.unlike(current_user)
    end
    redirect_to root_path
  end
end