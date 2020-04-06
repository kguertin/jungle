require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should validate if all fields are set' do
      @category = Category.new({:name => "Birds"})
      @product = Product.new({:name => "Blue Jay", :price => 1000, :quantity => 1, :category => @category})
      expect(@product).to be_valid
    end

    it 'should not validate when name is set to nil' do
      @category = Category.new({:name => 'Birds'})
      @product = Product.new({:name => nil, :price => 1000, :quantity => 1, :category => @category})
      expect(@product).to_not be_valid
      # expect(error.messages).to include(name: ['should not validate when name is set to nil'])
    end

    it 'should not validate when price is set to nil' do
      @category = Category.new({:name => 'Birds'})
      @product = Product.new({:name => "Blue Jay", :price => nil, :quantity => 1, :category => @category})
      expect(@product).to_not be_valid
    end

    it 'should not validate when quantity is set to nil' do
      @category = Category.new({:name => 'Birds'})
      @product = Product.new({:name => "Blue Jay", :price => 1000, :quantity => nil, :category => @category})
      expect(@product).to_not be_valid
    end

    it 'should not validate when category is set to nil' do
      @product = Product.new({:name => "Blue Jay", :price => 1000, :quantity => 1, :category => nil})
      expect(@product).to_not be_valid
    end

  end
end
