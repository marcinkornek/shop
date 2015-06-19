class User < ActiveRecord::Base
  has_many :addresses, dependent: :destroy
  has_many :orders,    dependent: :destroy

  before_save :prepare_to_save

  authenticates_with_sorcery!

  validates :password,                length: { minimum: 6 }, if: lambda { new_record? || !password.nil? }
  validates :password,                confirmation: true
  validates :password_confirmation,   presence: true, if: lambda { new_record? || !password.nil? }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-zA-Z\d\-]+(?:\.[a-zA-Z\d\-]+)*\.[a-zA-Z]+\z/i
  validates :email,                   uniqueness: { case_sensitive: false },
                                      format: { with: VALID_EMAIL_REGEX }

  VALID_NAME_REGEX = /\A[a-zA-ZàáâäãåąčćśęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+\z/u
  validates :first_name,              length: { in: 3..30 },
                                      format: { with: VALID_NAME_REGEX }
  validates :last_name,               length: { in: 3..30 },
                                      format: { with: VALID_NAME_REGEX }

  VALID_NUMBER_REGEX = /\d+/
  validates :tel_num,                 length: { is: 9 }, allow_blank: true,
                                      format: { with: VALID_NUMBER_REGEX }

  def self.find_for_oauth(auth)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      p '--------- already registered with oauth -----------'
      return user
    else
      p '--------- already registered -----------'
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        p '--------- creating user with oauth -----------'
        password = friendly_token
        user = User.new(first_name: auth.info.first_name,
                        last_name: auth.info.last_name,
                        provider:auth.provider,
                        uid:auth.uid,
                        email:auth.info.email,
                        password:password,
                        password_confirmation:password,
                      )
        user.send_activation_email = false
        user.save
        user.activate!
        return user
      end
    end
  end

  attr_accessor :send_activation_email

  def send_activation_needed_email!
    super if send_activation_email
  end

  ###############################

  private

  def self.friendly_token
    SecureRandom.urlsafe_base64(15).tr('lIO0', 'sxyz')
  end

  def prepare_to_save
    role.downcase!
    email.downcase!
    self.first_name = first_name.capitalize_words
    self.last_name = last_name.capitalize_words
  end

end
