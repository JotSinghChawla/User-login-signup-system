class User < ApplicationRecord
    puts "=============== User Model ================="

    before_save :encrypt_password

    validates :name, presence: true
    # validates :dob, presence: true

    private

    def encrypt_password
        self.password = Digest::SHA1.hexdigest(password)
    end

end
