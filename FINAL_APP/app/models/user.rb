class User < ApplicationRecord
    has_many :photos, dependent: :destroy
    has_many :albums, dependent: :destroy
    has_many :follower, :class_name => 'Follow', :foreign_key => 'follower_id'
    has_many :following, :class_name => 'Follow', :foreign_key => 'following_id'
    has_many :likes, dependent: :destroy
    has_many :photo_comments, dependent: :destroy

#     validates :firstName,
#             presence: true,
#             length: {minimum:2, maximum:20}
#        #     :tokenizer => lambda {|str| str.scan(/\w+/)}

#     validates :firstName,
#             presence: true,
#             length: {minimum:2, maximum:20}
#   #     :tokenizer => lambda {|str| str.scan(/\w+/)}

#     validates :email,
#             presence: true,
#             :uniqueness => true,
#             format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, 
#                 message: 'is not a valid email address' }
            

#     validates :password,
#                 presence: true,
#                 length: {minimum:8, maximum:100}
end