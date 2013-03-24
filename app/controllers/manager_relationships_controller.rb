class ManagerRelationshipsController < ApplicationController
	before_filter :signed_in_user

	def create
		@bar = Bar.find(params[:manager_relationship][:bar_id])
		current_user.manage!(@bar)
		respond_to do |format|
			format.html { redirect_to @bar }
			format.js
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