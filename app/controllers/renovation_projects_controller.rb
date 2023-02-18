class RenovationProjectsController < ApplicationController
  before_action :set_project, only: [:show]

  def index
    @projects = RenovationProject.all
  end

  def new
    @renovation_project = RenovationProject.new
  end

  def create
    @renovation_project = RenovationProject.new(renovation_project_params)

    if @renovation_project.save!
      redirect_to @renovation_project, success: 'Successfully Created Renovation Project!'
    else
      redirect_to action: 'new', alert: 'Failed to Create Renovation Project!'
    end
  end

  def show
    if @project.active_contract
      @general_contractor = @project.active_contract.general_contractor
      @contract = @project.active_contract
    else
      @general_contractors = GeneralContractor.search(@project).rank
    end
  end

  private
    def renovation_project_params
      params.require(:renovation_project).permit(:longitude, :latitude, :min_budget, :max_budget, :design_services, :build_services)
    end

    def set_project
      @project = RenovationProject.find_by(id: params[:id])
      redirect_to @project, alert: 'Project not found!' if @project.blank?
    end
end
