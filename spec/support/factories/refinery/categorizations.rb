
FactoryGirl.define do
  factory :profile, :class => Refinery::Profiles::Categorization do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

