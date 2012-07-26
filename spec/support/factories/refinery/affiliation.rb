
FactoryGirl.define do
  factory :profile, :class => Refinery::Profiles::Affiliation do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

