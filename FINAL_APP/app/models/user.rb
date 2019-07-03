class User < ApplicationRecord
    has_many :photos
    has_many :albums

    validates :firstName,
            presence: true,
            length: {minimum:2, maximum:20}
       #     :tokenizer => lambda {|str| str.scan(/\w+/)}

    validates :firstName,
            presence: true,
            length: {minimum:2, maximum:20}
  #     :tokenizer => lambda {|str| str.scan(/\w+/)}

    validates :email,
            presence: true,
            :uniqueness => true,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, 
                message: 'is not a valid email address' }
            

    validates :password,
                presence: true,
                length: {minimum:8, maximum:100}
end