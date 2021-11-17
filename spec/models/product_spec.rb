require 'rails_helper'

RSpec.describe Product, type: :model do

  let(:category) {
    Category.new(name: "testCategory")
  }
  subject {
    category.products.new(
      name: "testProduct",
      description: "this is a test product",
      image: "testImage",
      price_cents: 995,
      quantity: 15,
    )
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
      expect(subject.errors.full_messages).to be_empty
    end
    it "is not valid when password and password_confirmation don't match" do
      user = User.new(first_name: "Test", last_name: "Person", email: "test1@gmail.com", password: "something", password_confirmation: "else")
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include ("Password confirmation doesn't match Password")
    end
  end
end