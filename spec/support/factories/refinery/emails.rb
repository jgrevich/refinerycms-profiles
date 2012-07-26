
FactoryGirl.define do
  factory :profile, :class => Refinery::Profiles::Email do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

