class User < ApplicationRecord
	attr_accessor :remember_token, :activation_token, :reset_token

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, 
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  has_and_belongs_to_many :spoken_languages
  # Add a virtual field named `address` and a class method `address_fields` returning `JT::Rails::Address.fields` prefixed by `address_` in this case
  has_address :address
  has_many :posts
  has_and_belongs_to_many :availability

  include Filterable

  before_save   :downcase_email
  before_create :create_activation_digest
	validates :fname, presence: true, length: { maximum: 50 }
	validates :lname, presence: true, length: { maximum: 50 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
			  		  format: { with: VALID_EMAIL_REGEX },
			          uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  filterrific(
    default_filter_params: {},
    available_filters: [
      :with_mother_tongue,
      :with_locality,
      :with_start_time_gte
    ]
  )

  scope :with_mother_tongue, -> (search_string) {
  where("users.mother_tongue ILIKE ?", (search_string.to_s.gsub('*', '%') + '%').gsub(/%+/, '%'))
  }

  scope :with_locality, -> (search_string) {
    where("users.locality ILIKE ?", (search_string.to_s.gsub('*', '%') + '%').gsub(/%+/, '%'))
  }

  scope :with_start_time_gte, lambda { |ref_date|
    where('availability.start_time >= ?', ref_date)
  }

	# Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Activates an account.
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

   # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def age
    ((Time.zone.now - birthdate.to_time) / 1.year.seconds).floor
  end

  def self.apply_filters(params)
    user = self
    user = user_by_mother_tongue(mother_tongue: params[:mother_tongue]) if params[:mother_tongue].present?
    user = user_by_locality(locality: params[:locality]) if params[:locality].present?
    user
  end


  private

     # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end

    # Creates and assigns the activation token and digest.
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
end