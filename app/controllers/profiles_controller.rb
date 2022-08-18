class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def applicants
    @applications= Applicant.where(params[:profile_id])
   
  end
  def new
    @profile =  Profile.new
  end
  def create
  
    @profile  = Profile.create!(profile_params)
    redirect_to root_path
  end
  def edit
    @profile = Profile.find(:id)

  end
  def login
 
    profile = Profile.find_by(email: params[:email])
  
  if profile.present? && profile.authenticate(params[:password])

    redirect_to profile_posts_path(profile), notice: "You successfully logged In"
  else
   flash[ :alert] = "Wrong password or Undefined User"
    redirect_to new_profile_path 
  end
  end 
  def show
    @profiles = Profile.all

  end
  def closed
    @profile = Profile.find(params[:id])
    @posts = @profile.posts
  end
  def completed
    @posts = Post.where(seller_id: params[:id])
  end
  def review
    debugger
  end
  private
  def profile_params
    params.require(:profile).permit(:role,:name,:hired_freelacers,:phone,:email,:password,:country,:pending_projects,:completed_projects,:has_secure_password)
  end
end