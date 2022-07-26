require 'rails_helper'

RSpec.describe Bug, type: :model do
  it "is not valid without a title" do
    bug = Bug.new(title: nil)
    expect(bug).to_not be_valid
  end

  it "is not valid without a status" do
    bug = Bug.new(status: nil)
    expect(bug).to_not be_valid
  end

  it "is not valid without a bug_type" do
    bug = Bug.new(bug_type: nil)
    expect(bug).to_not be_valid
  end

  it "is not valid without a project" do
    bug = Bug.new(project_id: nil)
    expect(bug).to_not be_valid
  end

  it "is valid with valid attributes" do
    subject { Bug.new }
    subject.title = "BugsHelper"
    subject.status = 0
    subject.bug_type = 1
    user = User.new(name: "test1", email: "test1@example.com", password: "123456", role: "manager")
    subject.user = user
    project = Project.new(name: "testproj1", description: "testproj1")
    subject.project = project
    expect(subject).to be_valid
  end

  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:developer).class_name('User').without_validating_presence }
    it { should belong_to(:project) }
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:bug_type) }

  end

  # describe "Validations" do
  #   it { should validate_presence_of(:bidder) }
  # end

end
