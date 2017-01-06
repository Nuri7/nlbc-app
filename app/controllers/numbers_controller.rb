class NumbersController < ApplicationController

  def new
    @new = Number.new
  end

  def create
    @new = Number.new(params.require(:number).permit(:number))

    if @new.save
      redirect_to root_path, notice: 'Choose users please!'
    else
       render :new
    end
  end


end
