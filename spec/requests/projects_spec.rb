require 'rails_helper'

RSpec.describe "Projects", type: :request do
  # let!(:user) {User.create(name: "testq", email: "testq1@example.com", password: "123456", role: "manager")    }
  user = User.create(name: "testq", email: "testq1@example.com", password: "123456", role: "manager")    
  project = Project.create(name: "projjj", description: "Test Projectdd")
  # sign_in user

  before do
    sign_in user
  end


  # describe "GET index" do
  #   it "assigns all projects as @projects" do
  #     user = create(:user)
  #     # project = Project.create(name: "projjj", description: "Test Projectdd")
  #     # get :index
  #     # assigns(:projects).should eq([project])
  #   end
  # end

  it "Opens a create project form" do
    # sign_in user
    get "/projects/new"
    expect(response).to render_template(:new)
  end


  
  it "Opens error page when wrong id is given" do 
    get "/projects/:id", params: {id: project.id}
    expect(response).to render_template("projects/error.html.erb")
  end

  it 'Cheking create method of project' do
    f = Project.create(:name => "proj3", :description => "public")
    expect(Project.find_by_name("proj3")).to eq(f)
  end


  it 'Cheking update method of project' do
    project.update(:name => "Updated title")
    expect(Project.find_by_name("Updated title")).to eq(project)
  end

  it 'Checking destory method of project' do
    project.destroy
    expect(Project.find_by(name: "Updated title")).to be_nil
  end


end
