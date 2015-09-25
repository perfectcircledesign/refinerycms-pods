
FactoryGirl.define do
  factory :pod, :class => Refinery::Pods::Pod do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

