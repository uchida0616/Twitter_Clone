class TweetsController < ApplicationController

  def index
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(title: params[:tweet][:title], content: params[:tweet][:content])
  end
end
