class ProfileController < ApplicationController
  def edit_profile

    @user = User.find(session[:user_id])

    if request.patch?
    puts "============= Patch Request =============="
      if @user.update(user_params)
        
        @user.profile_image.attach(params[:user][:profile_image])
        if @user.profile_image.attached?
          puts "============= Profile Image Attached =============="
        end

        flash[:notice] = "Profile updated successfully"
        redirect_to '/'
      else
        flash[:alert] = "Error occured! User not Editted"
        render 'edit_profile'
      end
    end
  end

  private 

  def user_params
    params.require(:user).permit(:email, :name, :mobile, :dob, :profile_image)
  end
end
