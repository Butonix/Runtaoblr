class Api::UsersController<ApplicationController
  def create
    @user = User.new(user_params)
    # debugger
    if @user.save
      log_in(@user)
      # debugger
      render :show
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def show
    @user = current_user
  end

  def index
    @rand_users = User.where.not(id: current_user.id).order("RANDOM()").limit(5)
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
