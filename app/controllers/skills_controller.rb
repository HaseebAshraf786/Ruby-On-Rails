class SkillsController < ApplicationController
  def index
  end
  def new
    @skill = Skill.new
  end
  def create
    @skill = Skill.create(skill_params)
    redirect_to profile_posts_path
  end
  private
  def skill_params
    params.permit(:name,:perhourrate,:post_id)
  end
end
