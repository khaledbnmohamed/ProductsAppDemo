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

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    let(:user) { FactoryBot.create(:user) }

    it { should validate_presence_of(:email) }

    it 'ensure basic info presence' do
      expect(user.save).to eq(true)
    end

    it 'ensure admin false by default' do
      user = User.new(email: 'khaled@hotmail.com', password: '123456789')
      user.save
      expect(user.admin).to eq(false)
    end

  end
  context 'scope tests' do

  end
end
