class FeedbacksController < ApplicationController
	def create
		@feedback = Feedback.new(feedback_params)
	end

	private
	def feedback_params
		params.require(:feedback).permit(:name, :email, :description)
	end
end
