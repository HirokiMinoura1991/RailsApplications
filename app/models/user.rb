class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  and :omniauthable :trackable, :confirmable
  has_many :posts, inverse_of: :user
  validates_format_of :name, with: /^[a-zA-Z0-9_\.]*$/, multiline: true
  validate :validate_name
  
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:lockable, :timeoutable

  has_attached_file :avatar,
                     styles: { medium: '300x300>', thumb: '100x100>' },
                     default_url: '/saya_huro.png'

  validates_attachment_content_type :avatar,
                                    content_type: %r{\Aimage\/.*\z}



  attr_accessor :login

  def login
    @login || name || email
  end

  def validate_name
    errors.add(:name, :invalid) if User.where(email: name).exists?
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    conditions[:email]&.downcase! if conditions[:email]
    login = conditions.delete(:login)

    where(conditions.to_hash).where(
      ['lower(name) = :value OR lower(email) = :value',
       { value: login.downcase }]
    ).first
  end

  def created_month
    created_at.strftime('%Y年%m月')
  end

end
