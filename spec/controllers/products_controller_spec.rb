require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  before do
      FactoryBot.create_list(:product,5)
    end

  context 'GET /products' do
      it 'unauthorized if no login ' do
          get :index
          expect(response.status).to eq(401)
      end
  end

  context 'POST /products for users' do
      before :each do
          @user = FactoryBot.create(:user)
          sign_in @user
      end

      it 'unauthorized user ' do
          get :index
          expect(response.status).to eq(401)
      end
    end

    context 'POST /products for admin' do
      before :each do
          @admin_user = FactoryBot.create(:admin_user)
          sign_in @admin_user
      end

      it 'should return json products' do
        get :index
        expect(response.status).to eq(200)
      end
    end

    context 'PUT /products update product for admin' do
      before :each do
          @admin_user = FactoryBot.create(:admin_user)
          sign_in @admin_user
      end

      it 'should return json products' do
        get :index
        expect(response.status).to eq(200)
      end
    end
end
