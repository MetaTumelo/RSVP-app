class GuestsController < ApplicationController
skip_before_filter :authenticate_user!, only: [:new, :create, :thanks]

  def index
    @guest = Guest.order("created_at ASC").all
    @plusone = Plusone.order("created_at ASC").all

      @all_guest = @guest.count
      @all_additional = @plusone.count
      @decline = @guest.where(status: false).count
      @total = @all_guest + @all_additional - @decline

     respond_to do |format|
       format.html
       format.json
       format.js
    end

  end

  def new
    @guest = Guest.new
  end

  def thanks
    render params[:page]
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def create
    @guest = Guest.new(guest_params)
    if @guest.save
      respond_to do |format|
        format.html { redirect_to "/thanks" }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js
      end
    end
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    @guest = Guest.find(params[:id])
    if @guest.update_attributes(guest_params)
      flash[:success] = "profile updated"
      redirect_to @guest
    else
      render 'edit'
    end
  end

  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
    redirect_to guests_path
  end

private
  
  def guest_params
    params.require(:guest).permit(:status, :name, :message, plusones_attributes: [:id, :name, :oldness, :_destroy], detail_attributes: [:id, :bride, :groom, :date, :_destroy])
  end

end
