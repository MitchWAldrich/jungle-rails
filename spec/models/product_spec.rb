require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it 'should save successfully with all four fields set' do
      @category = Category.new
      @product = Product.new(name: 'Shirt', price: 20, quantity: 5, category: @category)
      expect(@product).to be_valid
      
      @product.save!
      expect(@product.id).to be_present 
    end

    it 'should be invalid without a name' do
      @category = Category.new
      @product = Product.new(name: nil, price: 21.25, quantity: 7, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq(["Name can't be blank"])
    end

    it 'should be invalid without a price' do
      @category = Category.new
      @product = Product.new(name: 'plant', price: nil, quantity: 17, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
    end

    it 'should be invalid without a quantity' do
      @category = Category.new
      @product = Product.new(name: 'rubber duck', price: 6.99, quantity: nil, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq(["Quantity can't be blank"])
    end

    it 'should be invalid without a category' do
      @category = Category.new
      @product = Product.new(name: 'chocolate tray', price: 16.99, quantity: 8, category: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eq(["Category can't be blank"])
    end

  end

end
