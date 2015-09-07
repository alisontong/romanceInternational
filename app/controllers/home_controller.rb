class HomeController < ApplicationController
  def index
  end

  def show
  @user = User.find(session[:user_id])
  end

 private
	def user_params
		params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :profession, :age, :gender, :height, :education, :country, :city, :number_of_children, :bio, :image_url)
	end
end
