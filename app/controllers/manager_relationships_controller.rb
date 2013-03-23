class ManagerRelationshipsController < ApplicationController
	before_filter :signed_in_user

	def create
		@bar = Bar.find(params[:manager_relationship][:bar_id])
		if @bar.authenticate(params[:manager_relationship][:password])
			current_user.manage!(@bar)
		respond_to do |format|
			format.html { redirect_to @bar }
			format.js
		end
		else
			flash.now[:error] = 'Invalid password'
			render 'new'
		end
	end
	def destroy
		@bar = ManagerRelationship.find(params[:id]).bar
		current_user.unmanage!(@bar)
		respond_to do |format|
			format.html { redirect_to @bar}
			format.js
		end
	end
end