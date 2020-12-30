class TweetsController < ApplicationController

  def index
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(params.require(:tweet).permit(:content))
    redirect_to new_tweet_path
  end
  private
  def blog_params
    params.require(:tweet).permit(:content)
  end
end
