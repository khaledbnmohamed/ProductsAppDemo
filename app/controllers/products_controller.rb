class ProductsController < ApplicationController
    respond_to :xml
    before_action :authenticate_user!
    # applying DRY we can use a certian method here to run before those actions instead of repeating the line itself
    # before_action :set_product , only: %i[show update destroy]

    def index
        authorize Product.new
        all_products = Product.all.select(:title,:price,:created_at) #retireve needed fields only from the db attributes
        return send_error(nil,:not_found) if all_products.blank?

        paginate xml: all_products, each_serializer: ProductSerializer, per_page: 15 , root: false
    end

    def show
        set_product
        return render xml: { product: @product.array_to_json } unless stale?(last_modified: @product.updated_at)

    end

    def update
        set_product
        return send_error(@product.errors.messages ,:bad_request) unless @contract.update(product_params)
        render xml: { product: @product.array_to_json }
    end


    def destroy
        set_product
        return render xml: { product: @product.array_to_json } unless stale?(last_modified: @product.updated_at)
    end

    private

    def set_product
        @product = Product.find(params[:id])
    end

    def product_params
        # permit only some params to avoid any unexpected changes
        params.require(:product).permit(:title, :image_url, :price)
    end

end
