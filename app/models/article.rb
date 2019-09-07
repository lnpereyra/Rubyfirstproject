class Article < ApplicationRecord
    #La tabla => Articles
    #Campos
    #Metodos
    validates :title, presence: true, uniqueness: true
    validates :body, presence: true, length: { minimum: 20 }
end
