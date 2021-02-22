class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :user_find_params, only: [:show, :edit, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save 
  end

  def show

  end

  def edit
    
  end

  def destroy
    if @user.destroy
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname,:email, :password, :password_confirmation, :full_name, :full_name_kana, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :job_id, :age_id, :gender_id)
  end

  def user_find_params
    @user = User.find(params[:id])
  end
end
