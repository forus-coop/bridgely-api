require 'securerandom'

class V1::Admin::User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable,
  # :database_authenticatable, :registerable, :recoverable, :rememberable

  devise :database_authenticatable, :trackable, :validatable

  before_save :ensure_authorization_token

  #Validations
  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :name, :presence => true
  validates :encrypted_password, :presence => true

  #Associations
  belongs_to :company

  private
  def ensure_authorization_token
    generate_authorization_token if self.authorization_token.nil?
  end

  def generate_authorization_token
    self.authorization_token = SecureRandom.base64(30).tr('+/=lIO0', 'pqrsxyz')
  end

end
