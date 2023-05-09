require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    before do
      @category = Category.create(name: "Test Category")
      @product = Product.new(name: "Test Product", price_cents: 9999, quantity: 99, category: @category)
    end

      it 'is valid with all four fields' do
        expect(@product).to be_valid
      end

      it 'is not valid without a name' do
        @product.name = nil
        @product.save
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      
      it 'is not valid without a price' do
        @product.price_cents = nil
        @product.save
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it 'is not valid without a quantity' do
        @product.quantity = nil
        @product.save
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end

      it 'is not valid without a category' do
        @product.category = nil
        @product.save
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Category must exist")
      end
    end
    
end
