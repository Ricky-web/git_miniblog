class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.all
  end
  
  def new
  end
  
  def create
    Tweet.create(text: tweet_params[:text], user_id: current_user.id)
    redirect_to :root
  end
  
  def show
    @tweet = Tweet.find(params[:id])
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    Tweet.update(tweet_params)
    redirect_to :root
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to :root
  end
  
  private
  def tweet_params
    params.permit(:text)
  end
  
end
