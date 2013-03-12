class StaticController < ApplicationController

	def about
	end

	def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ingredient_list }
    end
	end

end
