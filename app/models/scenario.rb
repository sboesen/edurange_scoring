class Scenario < ActiveRecord::Base
  attr_accessible :name, :nodes, :users

  has_many :attempts
end
