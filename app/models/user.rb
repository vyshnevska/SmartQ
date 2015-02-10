class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # devise :omniauthable
  # attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :role, :max_score, :notification

  # attr_accessible :provider, :uid, :name
  validates :name, :presence => true, :uniqueness => true


  # def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
  #   user = User.where(:provider => auth.provider, :uid => auth.uid).first
  #   unless user
  #     user = User.create(name:auth.extra.raw_info.name,
  #                          provider:auth.provider,
  #                          uid:auth.uid,
  #                          email:auth.info.email,
  #                          password:Devise.friendly_token[0,20]
  #                          )
  #   end
  #   user
  # end
end