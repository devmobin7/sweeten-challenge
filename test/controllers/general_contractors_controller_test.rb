require 'test_helper'

class GeneralContractorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @general_contractor = FactoryBot.create(:general_contractor)
  end

  test 'renders the index template' do
    get general_contractors_path

    assert_response :success
  end

  test 'render the new template' do
    get general_contractors_path(FactoryBot.create(:general_contractor))

    assert_response :success
  end

  test 'Post create a General Contractor' do
    post general_contractors_path, params: {
      general_contractor: {
        longitude: 55.3,
        latitude: 86.5,
        min_budget: 21000,
        max_budget: 92000,
        design_services: true,
        build_services: true,
        rating: 3,
        projects_count: 2,
      }
    }

    assert_response :redirect
  end

  test 'Get Show a General Contractor' do
    get general_contractors_path(@general_contractor)

    assert_response :success
  end
end
