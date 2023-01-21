class Entry < ApplicationRecord

    validates :name, presence: { message: ": jméno nesmí být prázdné" }

    validates :title, presence: { message: ": téma nesmí být prázdné" }

    validates :body, presence: { message: ": zápis sezení nesmí být prázdný" }
    
    validates :length, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 15, less_than_or_equal_to: 120, message: ": je třeba vyplnit délku sezení" }

    validates :session, numericality: { greater_than_or_equal_to: 0, only_integer: true, message: ": je třeba vyplnit číslo sezení"}



    belongs_to :user

    
end
