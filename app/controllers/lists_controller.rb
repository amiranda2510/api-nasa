class ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    lists = current_user.lists
    render json: lists  
  end

  def create
    new_list = List.new(list_params)
    new_list.user = current_user
    new_list.save!

    render json: new_list
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    render json: list
  end

  def destroy
    list = List.find(params[:id])
    list.destroy!
  end

  def add_img
    list = List.find(params[:id])
    new_daily_image = DailyImage.new(image_params)
    list.favorite_images.create(:daily_image => new_daily_image)
    render json: list.favorite_images
  end

  def delete_img
    list = List.find(params[:id])
    image = DailyImage.find(params[:id])
    list.daily_images.delete image
    list.reload
    render json: list.favorite_images
  end

  def show
    list = List.includes(:daily_images).find(params[:id])
    render json: list, include: [:daily_images]
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def image_params
    params.require(:daily_image).permit(:url, :description)
  end
end
