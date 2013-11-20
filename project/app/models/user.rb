class User < ActiveRecord::Base
  rolify

  before_save :generate_unique_id

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :username, :avatar, :remove_avatar, :name, :email, :password, :password_confirmation, :remember_me,
                    :provider, :uid

  mount_uploader :avatar, AvatarUploader

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }


  validates :username, uniqueness: { case_sensitive: false }, presence: true

  has_many :badges

  def update_with_password(params={})
    current_password = params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    #result = if valid_password?(current_password)
    result = if params[:password].blank? && if params[:password].blank? || valid_password?(current_password)
               update_attributes(params)
             else
               self.attributes = params
               self.valid?
               self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
               false
             end

            clean_up_passwords
            result
             end
  end

  def generate_unique_id
    self.unique_id = SecureRandom.uuid # => "72569edd-1841-4fd9-af05-edf66a58b74b"
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(name: data["name"],
                           provider:access_token.provider,
                           email: data["email"],
                           username: data["email"],
                           uid: access_token.uid ,
                           password: Devise.friendly_token[0,20],

        )
      end
    end
  end
end
