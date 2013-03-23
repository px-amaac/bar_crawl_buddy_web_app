class ManagerRelationshipsController < ApplicationController
	before_filter :signed_in_user

	def create
		@bar = Bar.find(params[:manager_relationship][:bar_id])
		current_user.manage!(@bar)
		redirect_to @bar
	end
	def destroy
		@bar = ManagerRelationship.find(params[:id]).bar
		current_user.unmanage!(@bar)
		redirect_to @bar
	end
end