require 'digest/sha1'

class User < ActiveRecord::Base
  belongs_to :role

  validates_presence_of :login, :email, :password, :password_confirmation
  validates_uniqueness_of :login
  validates_length_of :password, :within => 3..20

  attr_accessor :password_confirmation
  validates_confirmation_of :password

  validate :password_not_blank

  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self[:hashed_password] = User.encrypted_password(self.password, self.salt)
  end

  def password
    @password
  end

  def self.authenticate(name, pwd)
    user = self.find_by_name(name)
    if user
      expected_password = encrypted_password(pwd, user.salt)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end

  def method_missing(method_id, *args)
    if match = matches_dynamic_role_check?(method_id)
      tokenize_roles(match.captures.first).each do |check|
        return true if role.name.downcase == check
      end
      return false
    else
      super
    end
  end

  private

  def password_not_blank
    errors.add_to_base("Missing password") if hashed_password.blank?
  end

  def self.encrypted_password(pwd, salt)
    string_to_hash = pwd + 'wushu' + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end

  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

  def matches_dynamic_role_check?(method_id)
    /^is_an?_([a-zA-Z]\w*)\?$/.match(method_id.to_s)
  end

  def tokenize_roles(split_str)
    split_str.split(/_or_/)
  end
end
