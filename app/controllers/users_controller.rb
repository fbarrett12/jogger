class UsersController < ApplicationController
    def index
        @users = User.all 
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            confirm_password
            session[:user_id] = @user.id
            redirect_to posts_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to @user
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end

    
    # helper methods

    private

    def user_params
        params.require(:user).permit(:user_name, :password, :password_confirmation)
    end

    def confirm_password
        if params[:user][:password] == params[:user][:password_confirmation]
        else
            flash[:error] = "Passwords do not match. Please try again."
            redirect_to new_user_path
        end
    end
    
end

