10.times do
  list = List.create!(title: Faker::Hobby.activity)
  10.times do
    Item.create!(title: Faker::Food.dish, list: list)
  end
end
