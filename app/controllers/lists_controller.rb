class ListsController < ApplicationController
  before_action :find_list, except: [ :index, :new, :create ]
  def index
    @lists = List.all
  end

  def show
    # @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else 
      render :new
    end
  end

  def edit
  end

  def update
    
    @list.update(list_params)
    if @list.save
      redirect_to list_path(@list)
    else 
      render :edit
    end
  end

  def destroy
    
    @list.destroy
    redirect_to root_path
  end

  private

  def find_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
