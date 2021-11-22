FactoryBot.define do
  factory :user do
    email { 'test@test.com' }
    username { 'Mike'}
    password { '111111' }
  end
end
