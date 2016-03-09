class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    respond_to do |format|
      if @user.save
        UserMailer.welcome_email(@user).deliver_later

          format.html { redirect_to(@user, notice: 'User was successfully created.') }
          format.json { render json: @user, status: :created, location: @user }
      else
          format.html { render action: 'new' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
end
