class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  and :omniauthable :trackable,
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable
end
