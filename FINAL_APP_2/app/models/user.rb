class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:is_admin, :is_user]
  has_many :photos, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :follower, :class_name => 'Follow', :foreign_key => 'follower_id', dependent: :destroy
  has_many :following, :class_name => 'Follow', :foreign_key => 'following_id', dependent: :destroy
end
