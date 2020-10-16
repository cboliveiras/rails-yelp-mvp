puts 'Cleaning database....'
Restaurant.destroy_all


puts 'Database is clean!'

puts 'Creating restaurants...'

30.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: ['chinese', 'italian', 'japanese', 'french', 'belgian'].sample
  )
  50.times do
    @review = Review.create(
      content: Faker::Restaurant.review,
      rating: rand(1..5),
      restaurant: restaurant
    )
  end

  puts "restaurant id# #{restaurant.id} and review id# #{@review.id} created."
end

puts 'done'