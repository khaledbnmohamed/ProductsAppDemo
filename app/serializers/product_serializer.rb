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

class ProductSerializer < ActiveModel::Serializer
  attributes :title, :price, :created_at
end
