class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_read, presence: true
  validates :first_name_read, presence: true
  validates :birthday, presence: true
  validates :nickname, presence: true
end