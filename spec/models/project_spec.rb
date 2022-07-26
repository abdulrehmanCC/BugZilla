require 'rails_helper'

RSpec.describe Project, type: :model do
  it "is not valid without a name" do
    project = Project.new(name: nil)
    expect(project).to_not be_valid
  end

  it "is not valid without a description" do
    project = Project.new(description: nil)
    expect(project).to_not be_valid
  end

  it "is valid with valid attributes" do
    subject { Project.new }
    subject.name = "ProjectsHelper"
    subject.description = "This is a test"
    expect(subject).to be_valid
  end

  describe "Associations" do
    it { should have_many(:bugs) }
    it { should have_many(:project_users) }
    it { should have_many(:users).through(:project_users) }
    

  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end

end
