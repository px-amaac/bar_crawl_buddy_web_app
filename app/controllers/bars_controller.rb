class BarsController < ApplicationController
	before_filter :signed_in_user, :only => [:show, :new, :create, :destroy, :users]
	before_filter :admin_user, :only => [:new, :create, :destroy]

	def users
		@bar = Bar.find(params[:id])
		@users = @bar.users.paginate(page: params[:page])
	end
	def show
		@bar = Bar.find(params[:id])
	end

	def new
		@bar = Bar.new
	end

	def index
		@bars = Bar.paginate(page: params[:page])
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