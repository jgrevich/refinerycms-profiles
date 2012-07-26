
FactoryGirl.define do
  factory :profile, :class => Refinery::Profiles::Department do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

