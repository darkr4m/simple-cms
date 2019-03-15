class Subject < ApplicationRecord
  has_many :pages

  # this is where you will place scoped methods for your model
  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted_asc, lambda { order(:position => :asc) }
  scope :newest_first, lambda { where(:created_at => :desc) }
  scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"]) }

  validates :name, :presence => true, :length => {:maximum => 25}
end
