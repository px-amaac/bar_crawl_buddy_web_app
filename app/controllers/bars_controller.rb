class BarsController < ApplicationController

	def show
		@bar = Bar.find(params[:id])
	end

	def new
	end
end