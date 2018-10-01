class Fragment < ApplicationRecord
    validates :title, presence: true, length: {maximum: 10000}
    validates :introduction, length: {maximum: 1000} 
    validates :content, length: {maximum: 50000}
    validates :source, length: {maximum: 250}
    validates :user_iduser, presence: true    
end
