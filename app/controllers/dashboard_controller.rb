class DashboardController < ApplicationController
	before_action :authenticate_user!

	def index
		"hello"
	end


end
