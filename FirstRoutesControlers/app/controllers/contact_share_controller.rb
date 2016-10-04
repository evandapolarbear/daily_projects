class ContactSharesController < ApplicationController
  def index

  end
  #
  # def show
  #
  # end
  #
  # def update
  #   user = User.find(params[:id])
  #
  #   if user.nil?
  #     render status: :not_found
  #   else
  #     if user.update(user_params)
  #       render json: user
  #     else
  #       render_error(user)
  #     end
  #   end
  # end
  #
  # def create
  #   user = User.new (user_params)
  #   if user.save
  #     render json: User.all
  #   else
  #     render_error(user)
  #   end
  # end
  #
  # def destroy
  #   user = User.find(params[:id])
  #
  #   if user.nil?
  #     render status: :not_found
  #   else
  #     user.destroy
  #     render json: user
  #   end
  # end
  #
  # private
  #
  #
  #
  # def render_error(user)
  #   render json: user.errors.full_messages,
  #         status: :unprocessable_entity
  #
  # end
  #
  # def user_params
  #   params.require(:user).permit(:username)
  # end
end
