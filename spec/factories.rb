FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"
  factory :admin do
      admin true
    end
  end

  factory :bar do
  	bar_name	"Banshee"
  	lat			123321.32
  	long		321321.32
  	password "password"
  	password_confirmation "password"
  end

end