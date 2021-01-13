class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, foreign_key: :creator_id
  has_many :attendee, class_name: "User" ,foreign_key: :attendee_id
end
