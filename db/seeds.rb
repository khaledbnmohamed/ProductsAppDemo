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
Product.image_url.attach(io: File.open('app/'), filename: 'file.jpg')

Category.create!([
    {name: 'Book'},
    {name: 'DVD'},
    {name: 'Blu Ray'}
])
Product.create!([
    {title: 'Dom quixote de La Mancha', price: 12, category_id: Category.find_by_name('Book').id},
    {title: 'Hamlet', price: 3, category_id: Category.find_by_name('Book').id},
    {title: 'War and Peace', price: 7, category_id: Category.find_by_name('Book').id},
    {title: 'Moby Dick', price: 14, category_id: Category.find_by_name('Book').id},
    {title: 'Forrest Gump', price: 16, category_id: Category.find_by_name('DVD').id},
    {title: 'Taxi Driver', price: 25, category_id: Category.find_by_name('DVD').id},
    {title: 'The Godfather', price: 21, category_id: Category.find_by_name('DVD').id},
    {title: 'Star Wars: The Last Jedi', price: 48, category_id: Category.find_by_name('Blu Ray').id},
    {title: 'Dunkirk', price: 12, category_id: Category.find_by_name('Blu Ray').id},
    {title: 'Black Panther', price: 21, category_id: Category.find_by_name('Blu Ray').id}
])
end

