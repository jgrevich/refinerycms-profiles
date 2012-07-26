
FactoryGirl.define do
  factory :profile, :class => Refinery::Profiles::Location do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

