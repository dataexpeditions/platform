class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :studies, inverse_of: :author, foreign_key: 'author_id'

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  alias_attribute :admin?, :is_admin
end
