class HomeController < ApplicationController
  def index
    
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
    
    @every_post = Post.all
    
  end
  
  def write
    post = Post.new(title: params[:title], content: params[:content], user: current_user)
    post.save
    
    redirect_to "/home/index"
    
  end
  
  def destroy
    @one_post = Post.find(params[:id])
    @one_post.destroy
    redirect_to '/home/index'

  end
  
  def update
    @one_post = Post.find(params[:id])
  end
  
  def update_act
    @one_post = Post.find(params[:id])
    @one_post.title = params[:head]
    @one_post.content = params[:body]
    @one_post.save
    
    redirect_to '/home/index'
  end    
  

end
