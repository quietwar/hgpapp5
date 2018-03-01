class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
      devise :registerable,:database_authenticatable,# :confirmable,
             :recoverable, :rememberable, :trackable, :omniauthable, omniauth_providers: [:google_oauth2]#, :authentication_keys => {email: true, login: true}
             #validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
              validates :cohort_id, :city, presence: true
              validates :email, presence: false
              validates :password, presence: false #length: {:within => 6..46 }, on: :create
              validates :password_confirmation, presence: false #length: {:within => 6..40 }, on: :create
              has_attached_file :avatar, styles: { medium: '680x300>', thumb: '170x75>' }, default_url: '/assests/images/missing.png"'
                validates_attachment_content_type :avatar, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf"]
              after_create :create_room
              attr_accessor :login
              has_many  :attendances
              has_many  :classrooms, :through => :cohorts
              has_one :room, dependent: :destroy
              has_one :cohort, inverse_of: :user
              has_many :projects, inverse_of: :user
              has_many :messages, inverse_of: :user
                accepts_nested_attributes_for :cohort, :room, :projects, :allow_destroy => true
              has_many :friendships, class_name: "Genius"
              has_many :attendances, dependent: :destroy
              has_many :active_admin_comments, as: :resource, class_name: 'Hgp_staffStaff::Comment'
              alias_method :comments, :active_admin_comments
              belongs_to :cohort, inverse_of: :users
                validates_presence_of :cohort_id

      def self.find_for_database_authentication warden_conditions
        conditions = warden_conditions.dup
        login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
      end

      def full_name
        "#{first_name} #{last_name}"
      end

      def self.search_by_name(name)
        names_array = name.split(' ')

        if names_array.size == 1
          where('first_name LIKE ? or last_name LIKE ?',
            "%#{names_array[0]}%", "%#{names_array[0]}%").order(:first_name)
        else
          where('first_name LIKE ? or first_name LIKE ? or last_name LIKE ?
            or last_name LIKE ?', "%#{names_array[0]}%",
            "%#{names_array[1]}%", "%#{names_array[0]}%",
            "%#{names_array[1]}%").order(:first_name)
        end
      end

      def follows_or_same?(new_friend)
        friendships.map(&:friend).include?(new_friend) || self == new_friend
      end

      def current_friendship(friend)
        friendships.where(friend: friend).first
      end

      def self.from_omniauth(auth)
        byebug
        user.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.email = auth.info.email
          user.password = Devise.friendly_token[0,20]
          user.provider = auth.provider
          user.uid = auth.uid
          user.name = auth.info.name   # assuming the user model has a name
          user.image = auth.info.image # assuming the user model has an image
        end
      end

      # def self.from_omniauth(auth)
      #     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      #       user.name = auth.info.name
      #       user.provider = auth.provider
      #       user.uid = auth.uid
      #       user.email = auth.info.email
      #       user.image = auth.info.image
      #       user.password = Devise.friendly_token[0, 20]
      #     end
      #   end

        def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
            #byebug
            data = access_token.info
            user = User.where(:google_oauth2 => access_token.provider, :uid =>     access_token.uid ).first

            unless user
              #registered_user = User.where(:email => access_token.info.email).first

              #if registered_user
              #  return registered_user
              #else
                user = User.create(
                  name: data["genius"],
                  provider: access_token.provider,
                  email: data["email"],
                  uid: access_token.uid ,
                  password: Devise.friendly_token[0,20],
                )
              #end

           end

           user
        end

        def refresh_token_if_expired
        if token_expired?
          response = RestClient.post "https://accounts.google.com/o/oauth2/token", :grant_type => 'refresh_token', :refresh_token => self.refresh_token, :client_id => ENV['GOOGLE_CLIENT_ID'], :client_secret => ENV['GOOGLE_CLIENT_SECRET']
          refreshhash = JSON.parse(response.body)

          access_token_will_change!
          oauth_expires_at_will_change!

          self.access_token = refreshhash['access_token']
          self.oauth_expires_at = DateTime.now + refreshhash["expires_in"].to_i.seconds

          self.save
          puts 'Saved'
        end
      end

      def token_expired?
        expiry = Time.at(self.oauth_expires_at)
        return true if expiry < Time.now
        token_expires_at = expiry
        save if changed?
        false
      end


        def after_sign_up_path_for(user)
          '/root_path/'
        end

        def avatar_attributes=(attributes)
           # Marks the attachment for destruction on next save,
           # if the attributes hash contains a _destroy flag
           # and a new avatar was not uploaded at the same time:
           avatar.clear if has_destroy_flag?(attributes) && !avatar.dirty?
         end

         ROLES = %i[user admin superadmin]

         def roles=(roles)
           roles = [*roles].map { |r| r.to_sym }
           self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
         end

         def roles
           ROLES.reject do |r|
             ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
           end
         end

         def has_role?(role)
           roles.include?(role)
         end

    protected

        def self.send_reset_password_instructions attributes = {}
          recoverable = find_recoverable_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
          recoverable.send_reset_password_instructions if recoverable.persisted?
          recoverable
        end

        def self.find_recoverable_or_initialize_with_errors required_attributes, attributes, error = :invalid
          (case_insensitive_keys || []).each {|k| attributes[k].try(:downcase!)}

          attributes = attributes.slice(*required_attributes)
          attributes.delete_if {|_key, value| value.blank?}

          if attributes.size == required_attributes.size
            if attributes.key?(:login)
              login = attributes.delete(:login)
              record = find_record(login)
            else
              record = where(attributes).first
            end
          end

          unless record
            record = new

            required_attributes.each do |key|
              value = attributes[key]
              record.send("#{key}=", value)
              record.errors.add(key, value.present? ? error : :blank)
            #end
          end
          record
        end

        def self.find_record login
          where(["username = :value OR email = :value", {value: login}]).first
        end

    private

      def create_room
        hyphenated_username = self.full_name.split.join('-')
        Room.create(name: hyphenated_username, user_id: self.id)
      end
    end
end
