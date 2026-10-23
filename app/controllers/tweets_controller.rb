class TweetsController < ApplicationController # ← ここが ApplicationController になっているか確認
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    if current_user
      @tweet = current_user.tweets.build(message: params[:tweet][:message])
      if @tweet.save
        redirect_to tweets_path
        return
      end
    else
      @tweet = Tweet.new(message: params[:tweet][:message])
    end

    render :new, status: :unprocessable_entity
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to tweets_path
  end
end