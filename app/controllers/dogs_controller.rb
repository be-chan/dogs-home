class DogsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :dog_find_params, only: [:show, :edit,:update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @dogs = Dog.all.order('id DESC')
    search_dogs
    search_prefecture_culumn
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @dog.update(dog_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @dog.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def dog_params
    params.require(:dog).permit(:image, :title, :dog_gender, :dog_age_id, :vaccine, :surgery, :prefecture_id, :feature, :reason, :remarks).merge(user_id: current_user.id)
  end

  def search_dogs
    @q = Dog.ransack(params[:q])
    @dogs = @q.result(distinct: true)
  end

  def search_prefecture_culumn
    @prefecture = Prefecture.where.not(id: 1)
  end

  def dog_find_params
    @dog = Dog.find(params[:id])
  end

  def correct_user
    redirect_to root_path unless current_user.id == @dog.user.id
  end

end
