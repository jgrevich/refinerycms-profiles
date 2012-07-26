
FactoryGirl.define do
  factory :profile, :class => Refinery::Profiles::Title do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

