
FactoryGirl.define do
  factory :profile, :class => Refinery::Profiles::Profile do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

