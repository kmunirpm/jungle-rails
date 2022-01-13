require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'validations' do

    # before(:all) do
    #   @category = Category.new
    #   @category.name = 'Test Category'
    #   @category.save!
    # end

    it 'Validates all fields presence for successful save' do 
      @category = Category.new
      @category.name = 'Test Category'
      @category.save!

      @product = Product.new
      @product.name = 'Test Product'
      @product.price = 123
      @product.quantity = 123
      @product.category = @category
      @product.save

      expect(@product.errors.messages).not_to be_present
      puts @product.errors.messages
    end

    it 'Validates name presence for successful save' do 
      @category = Category.new
      @category.name = 'Test Category'
      @category.save!

      @product = Product.new
      @product.name = nil
      @product.price = 123
      @product.quantity = 123
      @product.category = @category
      @product.save

      expect(@product.errors.messages).to be_present
      puts @product.errors.messages
    end

    it 'Validates price presence for successful save' do 
      @category = Category.new
      @category.name = 'Test Category'
      @category.save!

      @product = Product.new
      @product.name = "Test Product"
      @product.price = nil
      @product.quantity = 123
      @product.category = @category
      @product.save

      expect(@product.errors.messages).to be_present
      puts @product.errors.messages
    end

    it 'Validates quantity presence for successful save' do 
      @category = Category.new
      @category.name = 'Test Category'
      @category.save!

      @product = Product.new
      @product.name = "Test Product"
      @product.price = 123
      @product.quantity = nil
      @product.category = @category
      @product.save

      expect(@product.errors.messages).to be_present
      puts @product.errors.messages
    end

    it 'Validates category presence for successful save' do 
      @category = Category.new
      @category.name = 'Test Category'
      @category.save!

      @product = Product.new
      @product.name = "Test Product"
      @product.price = 123
      @product.quantity = 123
      @product.category = nil
      @product.save

      expect(@product.errors.messages).to be_present
      puts @product.errors.messages
    end

  end

end