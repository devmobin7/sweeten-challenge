require 'test_helper'

class RenovationProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @renovation_project = FactoryBot.create(:renovation_project)
  end

  test 'renders the index template' do
    get renovation_projects_path

    assert_response :success
  end

  test 'Post create a Renovation Project' do
    post renovation_projects_path, params: {
      renovation_project: {
        longitude: 55.3,
        latitude: 86.5,
        min_budget: 21000,
        max_budget: 92000,
        design_services: true,
        build_services: true,
      }
    }

    assert_response :redirect
  end

  test 'Show a Renovation Project Controller' do
    renovation_project = FactoryBot.create(:renovation_project)

    get @renovation_project_path, params: { id: @renovation_project.id }

    assert_response :success
  end

  test 'Get Show a General Contractor' do
    get general_contractors_path(@general_contractor)

    assert_response :success
  end
end
