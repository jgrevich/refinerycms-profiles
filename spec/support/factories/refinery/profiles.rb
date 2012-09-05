
FactoryGirl.define do
  factory :profile, :class => Refinery::Profiles::Profile do
    sequence(:prefix) { |n| "refinery#{n}" }
  end
end

