class SignupsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

def create
    signup = Signup.create!(time: params[:time], camper_id: params[:camper_id], activity_id: params[:activity_id])
    render json: signup.activity, status: :created
end





private

def render_not_found_response
    render json: {error: "Signup not found"}, status: :not_found
end
def render_unprocessable_entity(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
end

end
