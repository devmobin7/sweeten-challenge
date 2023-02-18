require 'test_helper'

class ContractsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @renovation_project = FactoryBot.create(:renovation_project)
    @general_contractor = FactoryBot.create(:general_contractor)
  end

  test 'Post create a Contract' do
    post contracts_path, params: {
      general_contractor_id: @general_contractor.id,
      renovation_project_id: @renovation_project.id,
      status: :started,
      rating: 3
    }
  end

  test 'Update a Contract' do
    renovation_project = FactoryBot.create(:renovation_project)
    contract = FactoryBot.create(:contract)

    put contract_path(contract), params: { renovation_project_id: @renovation_project.id, general_contractor_id: @general_contractor.id }
  end
end
