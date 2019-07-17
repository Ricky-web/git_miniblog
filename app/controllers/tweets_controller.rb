class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.all
  end
  
  def new
  end
  
  def create
    Tweet.create(tweet_params)
    redirect_to :root
  end
  
  def show
    @tweet = Tweet.find(params[:id])
  end
  
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  def tweet_params
    params.permit(:text)
  end
  
end
