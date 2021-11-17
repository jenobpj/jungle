require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(
      first_name: "Jenob", 
      last_name: "Job", 
      email: "jenob@gmail.com", 
      password: "secret", 
      password_confirmation: "secret"
    )
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
      expect(subject.errors.full_messages).to be_empty
    end

      it "is not valid without first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include ("First name can't be blank")
    end
    it "is not valid when password and password_confirmation don't match" do
      subject.password_confirmation = "notsecret"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include ("Password confirmation doesn't match Password")
    end
    it "is not valid when email isn't unique (case insensitive)" do
      same_as_subject = User.create(first_name: "Test", last_name: "Person", email: "jenob@gmail.com", password: "secret", password_confirmation: "secret")
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include ("Email has already been taken")
    end
  end
end