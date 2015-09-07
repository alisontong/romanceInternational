class UsersController < ApplicationController
	def new
		@user = User.new
		render :new
	end

	def show
		@user = User.find(params[:id])
	end

	def index
		@users = User.all
	end

	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to edit_user_path(user)
		else
			flash[:error] = user.errors.full_messages.join(', ')
			redirect_to signup_path
		end
	end

	def edit
		@user = User.find(params[:id])
		render :edit
	end

	def update
		user = User.find(params[:id])
		if user == current_user
			user.update_attributes(user_params)
			redirect_to profile_path
		else
			session[:user_id] = nil
			redirect_to login_path
		end
	end

	
	def destroy
	end

	private
	def user_params
		params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :profession, :age, :gender, :height, :education, :country, :city, :number_of_children, :bio, :image_url)
	end

	# def page_user
 #      @page_user = User.friendly.find(params[:username])
 #    end
 #    helper_method :page_user

end

	
