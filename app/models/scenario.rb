class Scenario < ActiveRecord::Base
  attr_accessible :name, :nodes, :users
  after_create :parse_data

  has_many :attempts

  def parse_data
    # Create users for every user
    users = self.users.split('3')
    num_users = users.size
    (0..num_users).step(3).each do |num_user|
      name = users[num_user]
      pass = users[num_user+1]
      priv_key = users[num_user+2]
    end

    user = User.find_or_create_by_name :name => name, :email => name + "@edurange", :password => pass, :password_confirmation => pass, :private_key => priv_key
  end
end
