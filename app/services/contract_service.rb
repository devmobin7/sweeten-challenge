class ContractService
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def update(contract)
    contract.transaction do
      contract.update(update_contract_params)

      contractor = contract.general_contractor

      if params[:rating].present?
        rating = contractor.set_new_rating(contract.rating)

        contractor.update(rating: rating)
      end
    end

    contract
  end

  private
    def update_contract_params
      params.permit(:rating).tap do |additional_params|
        additional_params[:status] = 'closed'
      end
    end
end
