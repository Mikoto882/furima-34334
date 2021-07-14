FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    last_name             {'abc'}
    first_name            {'abc'}
    last_name_read        {'abc'}
    first_name_read       {'abc'}
    birthday              {'2000-12-31'} #"2000/12/31"
  end
end
