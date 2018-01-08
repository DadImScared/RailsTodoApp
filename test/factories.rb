
FactoryBot.define do
  factory :item do
    sequence(:title) { |n| "my item title #{n}" }
    :todo_list
  end

  factory :todo_list do
    sequence(:title) { |n| "my title #{n}" }
    user

    factory :todo_list_with_items do
      transient do
        item_count 5
      end

      after(:create) do |todo_list, evaluator|
        create_list(:item, evaluator.item_count, todo_list: todo_list)
      end
    end
  end

  factory :user do
    sequence(:email, 1000) { |n| "person#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    confirmed_at Time.now

    factory :user_with_todos do
      transient do
        list_count 5
      end

      after(:create) do |user, evaluator|
        create_list(:todo_list, evaluator.list_count, user: user)
      end
    end

    factory :user_with_todos_items do
      transient do
        list_count 5
        item_count 5
      end

      after(:create) do |user, evaluator|
        create_list(
            :todo_list_with_items,
            evaluator.list_count,
            user: user,
            item_count: evaluator.item_count
        )
      end
    end
  end
end
