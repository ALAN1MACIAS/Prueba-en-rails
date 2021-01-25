class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles # Un usuario puede tener muchos articulos, FOREIGN KEY
  has_many :comments
  include PermissionsConcern
end
