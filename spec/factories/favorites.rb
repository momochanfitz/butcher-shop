FactoryGirl.define do
  factory :favorite do
    name "pork carnitas"
    cut Cut.find_or_create_by_name("Factory Cut")
    user_id 1
    cut_id 1
  end
end
