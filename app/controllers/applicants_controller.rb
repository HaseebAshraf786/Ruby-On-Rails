class ApplicantsController < ApplicationController
  def index
 
    @applicants = Applicant.where(post_id: params[:post_id])

  end
  def show 
   
    @app = Applicant.find(params[:id])
    @app.astatus = 'hired'
    @app.save

    @post =Post.find(params[:post_id])
    @post.seller_id =  @app.profile_id
    @post.pstatus = 'closed'
    @post.progress = 'pending'
    @post.save
    redirect_to profile_posts_path

  end
  def new
    @applicant = Applicant.new
  end
  def create
    @applicant = Applicant.create(profile_id:params[:profile_id],post_id: params[:post_id])
  
    redirect_to "/profiles/#{@applicant.profile_id}/applicants"
  end

end
