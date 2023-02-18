class ContractsController < ApplicationController
  before_action :set_contract, only: [:update]
  before_action :set_renovation_project, only: [:create, :update]
  before_action :set_general_contractor, only: [:update]

  def create
    @contract = Contract.new(contract_params)

    if @contract.save
      flash.now[:success] = 'Successfully Signed Contract!'
    else
      flash.now[:alert] = 'Failed to Signed Contract!'
    end
  end

  def update
    @contract = ContractService.new(params).update(@contract)

    if @contract.valid?
      flash.now[:success] = 'Successfully Closed Contract!'
    else
      flash.now[:alert] = 'Failed to Close Contract!'
    end
  end

  private
    def contract_params
      params.permit(:renovation_project_id, :general_contractor_id)
    end

    def set_renovation_project
      @renovation_project = RenovationProject.find_by(id: params[:renovation_project_id])
      redirect_to renovation_projects_path, alert: 'Renovation Project not found!' if @renovation_project.blank?
    end

    def set_general_contractor
      @general_contractor = GeneralContractor.find_by(id: params[:general_contractor_id])
      redirect_to general_contractors_path, alert: 'General Contractor not found!' if @general_contractor.blank?
    end

    def set_contract
      @contract = Contract.find_by(id: params[:id])
      redirect_to renovation_projects_path, alert: 'Contract not found!' if @contract.blank?
    end
end
