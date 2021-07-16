FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'123abc'}
    password_confirmation {password}
    last_name             {'ひらがな'}
    first_name            {'ひらがな'}
    last_name_read        {'カタカナ'}
    first_name_read       {'カタカナ'}
    birthday              {'2000-12-31'} #"2000/12/31"
  end
end
