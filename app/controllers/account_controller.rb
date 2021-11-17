class AccountController < ApplicationController
  def login
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
        render 'signup'
      end

      puts "================ ENDING ==================="
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :mobile, :dob, :password)
  end
end
