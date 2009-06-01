class Competition < ActiveRecord::Base
  validates_presence_of :name

  has_many :events
  has_and_belongs_to_many :users
end
