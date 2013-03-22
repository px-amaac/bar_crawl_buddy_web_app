class BarsController < ApplicationController

	def show
		@bar = Bar.find(params[:id])
	end

	def new
		@bar = Bar.new
	end

	def create
		@bar = Bar.new(params[:bar])
		if @bar.save
			flash[:success] = "New Bar Created!"
			redirect_to @bar
		else
			render 'new'
		end
	end
end