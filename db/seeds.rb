# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end

File.open(File.expand_path(File.dirname(__FILE__)) + '/users.txt', 'r').each_line do |line|
  user, pass = line.split(',')
  user = user.chomp
  pass = pass.chomp
  User.find_or_create_by_email :name => user.dup, :email => user.dup+"@edurange.org", :password => pass.dup, :password_confirmation => pass.dup
end
nodes = File.open(File.expand_path(File.dirname(__FILE__)) + '/nodes.txt', 'rb').read
scenario = Scenario.new
scenario.name = "EDURange"
scenario.nodes = nodes
scenario.save!
