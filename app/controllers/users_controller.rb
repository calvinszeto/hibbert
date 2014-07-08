class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:create]

  # GET /users/1.json
  def show
		@user = current_user
  end
	
	# POST /users.json
	def create
		@user = User.new(user_params)

		if @user.save
			sign_in(@user)
			render :show, status: :created, location: @user, format: :json
		else
			render json: @user.errors, status: :unprocessable_entity
		end
	end

	# PATCH /users/1.json{?operation&no_show_source&no_show_restaurant&tried_restaurant}
	def update
		@user = current_user
		if (params[:no_show_source] &&
				source = Source.find(params[:no_show_source]))
			if params[:operation] == "add"
				@user.add_no_show_source(source)
			elsif params[:operation] == "remove"
				@user.remove_no_show_source(source)
			end
		end
		if (params[:no_show_restaurant] && 
				restaurant = Restaurant.find(params[:no_show_restaurant]))
			if params[:operation] == "add"
				@user.add_no_show_restaurant(restaurant)
			elsif params[:operation] == "remove"
				@user.remove_no_show_restaurant(restaurant)
			end
		end
		if (params[:tried_restaurant] &&
				restaurant = Restaurant.find(params[:tried_restaurant]))
			if params[:operation] == "add"
				@user.add_tried_restaurant(restaurant)
			elsif params[:operation] == "remove"
				@user.remove_tried_restaurant(restaurant)
			end
		end
		render :show, status: :ok, location: @user, format: :json 
	end

	# DELETE /users/1.json
	def destroy
		current_user.destroy
		head :no_content
	end

	private
		# Never trust parameters from the scary internet, only allow the white list through.
		def user_params
			params.require(:user).permit(:email, :password, :password_confirmation)
		end
end
