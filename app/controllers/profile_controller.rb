class ProfileController < ApplicationController
  def edit_profile

    @user = User.find(session[:user_id])

    if request.patch?
    puts "============= Patch Request =============="
      if @user.update(user_params)
        flash[:notice] = "Profile updated successfully"
        redirect_to '/account/login'
      else
        flash[:alert] = "Error occured! User not Editted"
        render 'edit_profile'
      end
    end
  end

  private 

  def user_params
    params.require(:user).permit(:email, :name, :mobile, :dob, :hashed_password)
  end
end
