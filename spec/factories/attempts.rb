# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attempt do
    user_id 1
    scenario_id 1
    score 1
    hosts "MyText"
  end
end
