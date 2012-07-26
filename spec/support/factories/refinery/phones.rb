
FactoryGirl.define do
  factory :profile, :class => Refinery::Profiles::Phone do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

