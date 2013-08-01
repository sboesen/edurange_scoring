class Scenario < ActiveRecord::Base
  attr_accessible :name, :nodes, :users
  after_create :parse_data

  has_many :attempts

  def parse_data
    # Create users for every user
    users = self.users.split('------ENDUSER------')
    users.each do |user|
      name,pass,priv = user.split(',')
      name = name.sub(/^[\n\r]*/, '') # Remove start newlnes
      if name.blank? || pass.blank? || priv.blank?
        next
      end
      pass = pass.sub(/^[\n\r]*/, '') 
      priv = priv.sub(/^[\n\r]*/, '')
      user = User.find_or_create_by_email :name => name, :email => name + "@edurange.com", :password => pass, :password_confirmation => pass, :private_key => priv
    end

  end
end
