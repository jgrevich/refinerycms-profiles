
FactoryGirl.define do
  factory :profile, :class => Refinery::Profiles::Category do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

