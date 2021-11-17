class User < ApplicationRecord
    puts "=============== User Model ================="

    before_save :encrypt_password

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
        return if hashed_password.blank?
        self.hashed_password = encrypt(hashed_password)
    end

end
