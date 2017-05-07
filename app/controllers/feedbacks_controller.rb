class FeedbacksController < ApplicationController
	def create
		@feedback = Feedback.new(feedback_params)

		if @feedback.save
			redirect_to root_path, notice: "Thanks for your feedback, I will contact you as soon as possible."
		else
			redirect_to root_path, notice: "Error submiting your feedback, Please try again!"
		end
	end

	private
	def feedback_params
		params.require(:feedback).permit(:name, :email, :description)
	end
end
