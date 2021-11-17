class AccountController < ApplicationController
  
  def login

    @user = User.new
    
    if request.post?
      @check_user = User.find_by_email(params[:user][:email])

      if @check_user
        
        if @check_user.authenticate(params[:user][:hashed_password], @check_user.hashed_password)
          session[:user] = @check_user.name
          flash[:notice] = "Logged in Successfully"
          redirect_to '/'
        else
          flash[:alert] = "Invalid password"
          render 'login'
        end

      else
        flash[:alert] = "Email not found"
        render 'login'
      end
    end

  end

  def signup
    puts "================ STARTING ==================="

    @user = User.new

    if request.post?
      @new_user = User.new(user_params)

      if @new_user.save
        

        # Action Mailer
        flash[:notice] = "User created successfully. Check your email for confirmation"

        redirect_to '/'
      else 
        flash[:alert] = "User not created"
        render 'signup'
      end

      puts "================ ENDING ==================="
    end
  end

  def logout
    session[:user] = nil
    flash[:notice] = "You are Logged out"
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :mobile, :dob, :hashed_password)
  end
end
