class BarsController < ApplicationController
	before_filter :signed_in_user, :only => [:show, :new, :create, :destroy]
	before_filter :admin_user, :only => [:new, :create, :destroy]

	def show
		@bar = Bar.find(params[:id])
	end

	def new
		@bar = Bar.new
	end

	def index
		@bars = Bar.all
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