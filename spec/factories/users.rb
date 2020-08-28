# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  avatar                 :string
#  password               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  admin                  :boolean          default(FALSE)
#  role                   :integer
#

FactoryBot.define do
  factory :user do
        sequence(:email) { |i| "rspec_user#{i}@example.com" }
        password {"123456789"}
        admin {false}
  end
  factory :admin_user , class: User, parent: :user do
    admin {true}
  end
end
