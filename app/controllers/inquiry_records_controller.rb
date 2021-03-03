class InquiryRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :dog_find_params, only: [:index, :new, :create]

  def index
    @record_form = RecordForm.new
  end

  def new
    @record_form = RecordForm.new
  end
  
  def create
    @record_form = RecordForm.new(record_form_params)
    if @record_form.valid?
      @record_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def record_form_params
    params.require(:record_form).permit(:experience, :care_take, :hope).merge(user_id: current_user.id, dog_id: params[:dog_id])
  end

  def dog_find_params
    @dog = Dog.find(params[:dog_id])
  end

end
