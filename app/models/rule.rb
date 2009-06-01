class Rule < ActiveRecord::Base
  validates_presence_of :name
  validates_numericality_of :deduction

  has_and_belongs_to_many :rulesets
end
