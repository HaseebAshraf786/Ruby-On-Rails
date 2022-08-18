class Profile < ApplicationRecord
    has_secure_password
    enum role: {buyer: '0',seller: '1'}
    has_many :posts
    
end
