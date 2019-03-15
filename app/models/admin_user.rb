class AdminUser < ApplicationRecord
  has_and_belongs_to_many :pages
  has_many :section_edits
  has_many :sections, :through => :section_edits

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates :first_name,  :presence => true, :length => {:maximum => 25}
  validates :last_name,  :presence => true, :length => {:maximum => 25}
  validates :username, :presence => true, :length => {:within => 5..25}, :uniqueness => true
  validates :email, :presence => true, :length => {:maximum => 50}, :uniqueness => true, :format => EMAIL_REGEX, :confirmation => true

  # validates_presence_of :first_name
  # validates_length_of :first_name, :maximum => 25
  # validates_presence_of :last_name
  # validates_length_of :last_name, :maximum => 25
  # validates_presence_of :username
  # validates_length_of :username, :within => 5..25
  # validates_uniqueness_of :username
  # validates_presence_of :email
  # validates_uniqueness_of :email
  # validates_length_of :email, :maximum => 50
  # validates_format_of :email, :with => EMAIL_REGEX
end
