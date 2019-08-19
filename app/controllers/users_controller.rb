class UsersController < ApplicationController
  skip_before_action :authenticate_request!, only: [:create]

	def create
  	@user = User.new(user_params)
  	if @user.save
        auth_token = JsonWebToken.encode({user_id: @user.id})  
    		render json: { user: UserSerializer.new(@user), message: 'User created successfully', jwt: auth_token },
        	status: :created
  	else
    		render json: { errors: 'failed to create user' },
          	status: :not_acceptable
  	end
  end

  def profile
    render json: { user: UserSerializer.new(@current_user) }, status: :ok
  end

  def profile_update
    if params[:user][:new_password]
      @current_user.update(password: params[:user][:new_password])
      render json: {user: UserSerializer.new(@current_user), message: 'Password Updated Sucessfully'},
        status: :updated
    else
      render json: {error: "New password not found"},
        status: :not_acceptable
    end
  end

	private
  def user_params
	  params.require(:user)
      	.permit(:user_name,
              	:password,
              	:password_confirmation)
  end
end
