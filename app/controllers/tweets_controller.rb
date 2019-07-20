class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.order('updated_at DESC').page(params[:page]).per(5)
  end
  
  def new
  end
  
  def create
    if text_confirmation
      redirect_to new_tweet_path, alert: '▼ Please enter the text.'
      
    else
      Tweet.create(text: tweet_params[:text], user_id: current_user.id)
      redirect_to :root
    end
  end
  
  def show
    @tweet = Tweet.find(params[:id])
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    if text_confirmation
      redirect_to "/tweets/#{params[:id]}/edit", alert: '▼ Please enter the text.'
    else
      tweet = Tweet.find(params[:id])
      tweet.update(text: tweet_params[:text])
      redirect_to :root, alert: '▼ Updated!'
    end
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to :root, alert: '▼ Deleted!'
  end
  
  private
  def tweet_params
    params.permit(:text)
  end
  
  def text_confirmation
    text = params.permit(:text)
    return text[:text].blank?
  end
end
