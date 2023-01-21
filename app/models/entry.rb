class Entry < ApplicationRecord
    validates :name, presence: true
    validates :title, presence: true
    validates :body, presence: true
    
    validates :length, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 15, less_than_or_equal_to: 120 }

    validates :session, numericality: { greater_than_or_equal_to: 0, only_integer: true}



    belongs_to :user


  

    
end
