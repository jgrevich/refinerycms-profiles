
FactoryGirl.define do
  factory :profile, :class => Refinery::Profiles::Url do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

