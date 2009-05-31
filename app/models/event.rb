class Event < ActiveRecord::Base
  belongs_to :competition
  has_and_belongs_to_many :users
end
