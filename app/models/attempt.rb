class Attempt < ActiveRecord::Base
  attr_accessible :hosts, :scenario_id
  belongs_to :scenario
  belongs_to :user
  before_create :score_submission

  def score_submission
    self.score = 0
    if self.scenario
      self.hosts.split("\n").each do |host|
        if self.scenario.nodes.split("\n").include? host
          self.score = self.score + 1
        else
          self.score = self.score - 1
        end
      end
    end
  end
end
