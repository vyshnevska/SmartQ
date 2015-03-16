class UsersController < AdminController
  before_action :users_with_locations, :only => [:index, :show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    redirect_to :back, :alert => "Access denied." unless @user == current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private
    def secure_params
      params.require(:user).permit(:role)
    end

    def users_with_locations
      @locations = User.select{|u| u.location.presence}
    end

end
