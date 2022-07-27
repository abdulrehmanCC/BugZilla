require 'rails_helper'
require 'support/factory_bot'

RSpec.describe "Projects", type: :request do

  # This will guess the User class
  FactoryBot.define do
    factory :user do
      name {"John"}
      email  {"Doe@john.com"}
      password {"123456"}
      role {"manager"}
    factory :developer do      
      role {"developer"}
    end   
    factory :qa do      
      role {"qa"}
    end 
    end
  end

  FactoryBot.define do
    factory :project do
      name {"projj"}
      description  {"testproj"}
    end
  end
  

  it "manager can render the index method" do
    user = create(:user)
    project = user.projects.create(attributes_for(:project))
    sign_in user
    get projects_path
    expect(response).to render_template("index")
  end

  


  it "manager can render the show method" do
    # puts "#{project.name}"
    user = create(:user)
    project = user.projects.create(attributes_for(:project))
    sign_in user
    get project_path(project)
    expect(response).to render_template("show")
  end

  it "manager can render the new method" do
    # puts "#{project.name}"
    user = create(:user)
    project = user.projects.create(attributes_for(:project))
    sign_in user
    get new_project_path
    expect(response).to render_template("new")
  end

  it "developer cannot render the new method" do
    # puts "#{project.name}"
    user = create(:developer)
    project = user.projects.create(attributes_for(:project))
    sign_in user
    get new_project_path
    expect(response).to_not render_template("new")
  end


  it "manager can render the edit method" do
    # puts "#{project.name}"
    user = create(:user)
    project = user.projects.create(attributes_for(:project))
    sign_in user
    get edit_project_path(project)
    expect(response).to render_template("edit")
  end

  it "developer cannot render the edit method" do
    # puts "#{project.name}"
    user = create(:developer)
    project = user.projects.create(attributes_for(:project))
    sign_in user
    get edit_project_path(project)
    expect(response).to_not render_template("edit")
  end


  it "manager render the destroy method" do
    # puts "#{project.name}"
    user = create(:user)
    project = user.projects.create(attributes_for(:project))
    sign_in user
    delete project_path(project)
    expect(response).to have_http_status(302)
  end





  # it "should render the create method" do
  #   user = create(:user)
  #   project = user.projects.create(attributes_for(:project))
  #   sign_in user
  #   post projects_path
  #   expect(response).to render_template("create")
  # end





  # it "Opens a create project form" do
  #   # sign_in user
  #   get "/projects/new"
  #   expect(response).to render_template(:new)
  # end


  
  # it "Opens error page when wrong id is given" do 
  #   get "/projects/:id", params: {id: project.id}
  #   expect(response).to render_template("projects/error.html.erb")
  # end

  # it 'Cheking create method of project' do
  #   f = Project.create(:name => "proj3", :description => "public")
  #   expect(Project.find_by_name("proj3")).to eq(f)
  # end


  # it 'Cheking update method of project' do
  #   project.update(:name => "Updated title")
  #   expect(Project.find_by_name("Updated title")).to eq(project)
  # end

  # it 'Checking destory method of project' do
  #   project.destroy
  #   expect(Project.find_by(name: "Updated title")).to be_nil
  # end


end
