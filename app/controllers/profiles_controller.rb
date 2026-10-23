class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @profile = @user.profile
  end

  def new
    @profile = Profile.new
  end

  def create
    user = User.find_by(uid: session[:login_uid])
    @profile = Profile.new(message: params[:profile][:message], user_id: user.id)
    if @profile.save
      redirect_to profile_path(user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(message: params[:profile][:message])
      redirect_to profile_path(@profile.user)
    else
      render :edit, status: :unprocessable_entity
    end
  end
end