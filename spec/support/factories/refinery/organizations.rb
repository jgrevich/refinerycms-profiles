
FactoryGirl.define do
  factory :profile, :class => Refinery::Profiles::Organization do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

