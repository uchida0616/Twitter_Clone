class TweetsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if params[:back]
      render :new
    else
      if @tweet.save
        redirect_to tweets_path, notice: "ツイートしました！"
      else
        render :new
      end
    end
  end

  def show;end

  def edit;end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: "ツイートを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice:"ツイートを削除しました！"
  end

  def confirm
    @tweet = Tweet.new(tweet_params)
    render :new if @tweet.invalid?
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end

  def set_blog
    @tweet = Tweet.find(params[:id])
  end
end
