class PostsController < ApplicationController
  def index
    if params[:commit] != "search"
      @profile =  Profile.find(params[:profile_id])
      session[:id] = @profile.id
    end
    if params[:commit] == "search"
      @skills = Skill.where("name LIKE ?","%#{params[:name]}%")
      @posts = []
      @skills.each do |i|
        @posts<<i.post
      end
    elsif @profile.role == "buyer"
      @posts =  Profile.find(params[:profile_id]).posts
    else
      @posts = Post.all
    end
  
  end
  def show
    
    @post  = Post.find(params[:id])
    @post.progress = 'completed'
    @post.save
    @posts = Post.all
  end
  def new
    @posts =Post.new
  end
  def create  
    
    @profile = Profile.find(params[:profile_id])
    @post = @profile.posts.create(post_params)
    @post.buyer_id = params[:profile_id]
    @post.save
    profile = Profile.find(params[:profile_id])
    redirect_to profile_posts_path(profile)
  end
  def review
    @posts = Post.find(params[:id])
  end
  def rate
    @post =Post.find(params[:id])
    @post.rate = params[:rate]
    @post.save
    redirect_to "/profiles/#{params[:profile_id]}/posts"
  end
  def search
    
    @skills = Skill.where("name LIKE ?","%#{params[:name]}%")
    @posts = []
    @skills.each do |i|
        @posts<<i.post
    end
   render :index 
   
   
  end
  private
  def post_params
    params.permit(:requirement,:description,:budget,:seller_id,:buyer_id,:profile_id,:pstatus)
  end
end
