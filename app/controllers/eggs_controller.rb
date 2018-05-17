class EggsController < ApplicationController

  def get_web3
    web3 = Web3::Eth::Rpc.new host: ENV['INFURA_ENDPOINT'], 
              port: 443,  
              connect_options: {
              open_timeout: 20,
              read_timeout: 140,
              use_ssl: true,
              rpc_path: '/'+ENV['INFURA_API_KEY']
            }
    return web3
  end

  def get_by_address

  	if params[:address].blank?
  		raise ActiveRecord::RecordNotFound, "Address not found."
  	end

    web3 = get_web3

    contract_info = Contract.where("name": "EGG_FACTORY").first
    if contract_info.blank?
      raise ActiveRecord::RecordNotFound, "Can't find contract."
    end

    eggFactoryContract = web3.eth.contract(JSON.parse(contract_info.abi));

    eggFactory = eggFactoryContract.at(contract_info.address)

    mock_valid_eggs = [0, 1]

    response = Hash.new

    mock_valid_eggs.each do |egg_id|
      eggAmount = eggFactory.eggsOwned(params[:address], egg_id)
      if !eggAmount.blank?
        response[egg_id] = eggAmount
      end
    end

  	render json: response

  end
end
