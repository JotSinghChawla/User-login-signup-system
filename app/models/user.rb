class User < ApplicationRecord

    puts "=============== User Model ================="
    validates :name, presence: true
end
