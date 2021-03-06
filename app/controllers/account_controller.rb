class AccountController < ApplicationController
  
  def login
    
    if request.post?
      @check_user = User.find_by_email(params[:email])

      if @check_user
        
        if @check_user.authenticate(params[:password], @check_user.hashed_password)
          session[:user_id] = @check_user.id
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
    session[:user_id] = nil
    flash[:notice] = "You are Logged out"
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :mobile, :dob, :hashed_password, :password)
  end
end
