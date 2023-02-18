class GeneralContractorsController < ApplicationController
  before_action :set_contractor, only: [:show]

  def index
    @contractors = GeneralContractor.all
  end

  def new
    @general_contractor = GeneralContractor.new
  end

  def create
    @general_contractor = GeneralContractor.new(general_contractor_params)

    if @general_contractor.save
      redirect_to @general_contractor, success: 'Successfully Created General Contractor!'
    else
      redirect_to action: 'new', alert: 'Failed to Create General Contractor!'
    end
  end

  def show
    @renovation_projects = @contractor.renovation_projects if has_contracts
    @contracts = @contractor.contracts
  end

  private
    def general_contractor_params
      params.require(:general_contractor).permit(:longitude, :latitude, :min_budget, :max_budget, :design_services, :build_services)
    end

    def set_contractor
      @contractor = GeneralContractor.find_by(id: params[:id])
      redirect_to @contractor, alert: 'Contract not found!' if @contractor.blank?
    end

    def has_contracts
      @contractor.contracts.present?
    end
end
