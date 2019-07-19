class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.all
  end
  
  def new
  end
  
  def create
    Tweet.create(text: tweet_params, user_id: current_user.id)
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
  end
  
  def destroy
    @tweet = Tweet.find(params[:id])
  end
  
  private
  def tweet_params
    params.permit(:text)
  end
  
end
