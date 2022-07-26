require 'rails_helper'

RSpec.describe User, type: :model do
  it "is not valid without a name" do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end 
  it "is not valid without a email" do
    user = User.new(email: nil)
    expect(user).to_not be_valid
  end
  it "is not valid without a password" do
    user = User.new(password: nil)
    expect(user).to_not be_valid
  end
  it "is not valid without a role" do
    user = User.new(role: nil)
    expect(user).to_not be_valid
  end

  it "is valid with valid attributes" do
    user = User.new(name: "test", email: "test11@example.com", password: "123456", role: "manager")
    expect(user).to be_valid
  end


  describe "Associations" do
    it { should have_many(:bugs) }
    it { should have_many(:created_bugs).class_name('Bug') }
    it { should have_many(:assigned_bugs).class_name('Bug') }
    it { should have_many(:project_users) }
    it { should have_many(:projects).through(:project_users) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:role) }

  end


end
