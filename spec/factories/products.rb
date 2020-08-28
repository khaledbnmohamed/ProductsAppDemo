# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  title      :string
#  price      :float
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :product do
        price {rand(1..545_645_46)}
        title {Faker::Dessert.variety}
        image_url {File.open(Rails.root.join('app', 'qmr.jpeg'))}
  end
end
