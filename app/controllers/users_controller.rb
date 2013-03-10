class UsersController < ApplicationController
  def index
  	@user = User.new
  end

  def create
  	@user.size = User.new(params[:size])
	if @user.save
  		flash[:notice] = "Yep"
		redirect_to ingredients_lists_path
	else
		flash[:alert] = "Nope"
		render :action => "index"
	end
  end


  def update
  	if @user.update_attributes(params[:size])
  		flash[:notice] = "Yep"
		redirect_to ingredients_lists_path
	else
		flash[:alert] = "Nope"
		render :action => "index"
	end
  end




end
