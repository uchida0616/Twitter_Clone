class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
    redirect_to new_tweet_path
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  private
  def blog_params
    params.require(:tweet).permit(:content)
  end
end
