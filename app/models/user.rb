class User < ApplicationRecord
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  validates :username, presence: true, uniqueness: true

  has_many :movies #, :dependent => :destroy
  has_many :movie_torrents, through: :movies #, :dependent => :destroy

  def self.find_for_database_authentication warden_condition
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(
      ["lower(username)= :value OR lower(email) = :value", {
      value: login.strip.downcase}]).first
  end
end
