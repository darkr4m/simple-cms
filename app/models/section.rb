class Section < ApplicationRecord
  belongs_to :page
  has_many :section_edits
  has_many :admin_users, :through => :section_edits

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted_asc, lambda { order(:position => :asc) }
  scope :newest_first, lambda { where(:created_at => :desc) }
  scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"]) }
  validates_presence_of :name
end
