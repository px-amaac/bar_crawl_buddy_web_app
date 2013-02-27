FactoryGirl.define do
  factory :user do
    name     "Aaron McIntyre"
    email    "px.amaac@gmail.com"
    password "password"
    password_confirmation "password"
  end
end