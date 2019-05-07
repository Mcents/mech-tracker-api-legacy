class User < ApplicationRecord
  has_secure_password
  has_many :terms
  validates_presence_of :username, :email, :password_digest
  validates :email, uniqueness: true
  validates_format_of :email, with: /@/

  before_save :downcase_email

  def downcase_email
    self.email.downcase!
  end
end
