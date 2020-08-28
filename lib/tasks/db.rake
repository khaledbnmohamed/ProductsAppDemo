namespace :db do
  desc 'Drop, create, migrate, and repopulate with sample data'
  task repopulate: [:drop, :create, :migrate, :fakeit] do
    puts 'Done'
  end

  desc 'TODO'
  task fakeit: :environment do
    50.times do
      User.create!(
        name: Faker::Name.name,
        password: Faker::Internet.password,
        email: Faker::Internet.email(name: :name)
      )
    end
    150.times do
      Product.create!(
        price: rand(1..545_645_46),
        title: Faker::Dessert.variety
      )
    end
  end
end
