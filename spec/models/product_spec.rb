require 'rails_helper'

# RSpec.describe Product, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before '' do
      @category = Category.new
      @product = Product.new(
        name: 'Shoes',
        price: 1000,
        quantity: 5,
        category: @category
      )
    end
    it 'saves a product successfully' do
      @product.save!
      expect(@product.errors.full_messages).to be_empty
    end
    it "returns Name can't be blank when no name given" do
      @product.name = nil
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "returns Price can't be blank when no price given" do
      @product.price_cents = nil
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it "returns Quantity can't be blank when no quantity given" do
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it "returns Category can't be blank when no category given" do
      @product.category = nil
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
