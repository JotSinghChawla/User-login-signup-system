class User < ApplicationRecord
    
    attr_accessor :password  #temporary storage, will be removed after login

    before_save :encrypt_password
    
    before_save {self.email = email.downcase}

    validates :email, presence: true

    def authenticate(pass, hashed_pass)
        if hashed_pass == encrypt(pass)
            return true
        end
    end

    private

    def encrypt(pass)
        return Digest::SHA1.hexdigest(pass)
    end 

    def encrypt_password
        puts "=============== encrypting password: #{ hashed_password } ================"

        return if password.blank?
        self.hashed_password = encrypt(password)
    end

end
