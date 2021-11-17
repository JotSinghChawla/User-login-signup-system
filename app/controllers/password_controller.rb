class PasswordController < ApplicationController
  def forget_password
    @user = User.new

    if request.post?
      @check_user = User.find_by_email(params[:user][:email]) 
      if @check_user
        new_password = SecureRandom.hex(10)   
        
        # We can also use the following for Random Password generator
        # puts (0..10).map{65.+(rand(25)).chr}.join       # Create a random string of 10 characters
        
        @check_user.update(hashed_password: 'password')

        puts "New password is #{new_password}"

        # ActionMailer triggered
        flash[:notice] = "Your new password is sent to your email address"
        redirect_to "/account/login"
      else
        flash[:alert] = "Email address not found"
        render 'forget_password'
      end
    end

  end

  def reset_password
  end

end
