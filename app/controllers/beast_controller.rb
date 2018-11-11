class BeastController < ApplicationController

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

  def get_information

  	if params[:id].blank?
  		raise ActiveRecord::RecordNotFound, "Beast not found."
  	end

  	id = params[:id]

  	web3 = get_web3

    contract_info = Contract.where("name": "BEASTS").first
    if contract_info.blank?
      raise ActiveRecord::RecordNotFound, "Can't find contract."
    end

    beastsContract = web3.eth.contract(JSON.parse(contract_info.abi))

    beasts = beastsContract.at(contract_info.address)

    # Attribute list format
    #  uint race, bool isGestating, bool isReady, uint256 cooldownEndBlock, bool isReadyToFight, uint256 experience, 
    #  uint256 birthTime, uint256 sireId, uint256 matronId, uint256 siringWithId, uint256 cooldownIndex, uint256 generation, 
    #  uint256 genes 
    beast_attribute_list = beasts.getLegend(id.to_i)
    owner = beasts.beastIndexToOwner(id.to_i)

  	beast_structure = {
	    :race => beast_attribute_list[0],
	    :genes => beast_attribute_list[12],
	    :experience => beast_attribute_list[5],
	    :isGestating => beast_attribute_list[1],
	    :birthTime => beast_attribute_list[6],
	    :cooldownEndBlock => beast_attribute_list[3],
	    :sireId => beast_attribute_list[7],
	    :matronId => beast_attribute_list[8],
	    :siringWithId => beast_attribute_list[9],
	    :cooldownIndex => beast_attribute_list[10],
	    :generation => beast_attribute_list[11],
	    :isReady => beast_attribute_list[2],
	    :isReadyToFight => beast_attribute_list[4],
	    :preferedAttribute => 0,
	    :element => 0,
	    :pedigree => 1,
      :owner => owner,
	    :attrs => {
	        :strength => 1,
	        :dexterity => 1,
	        :endurance => 1,
	        :knowledge => 1,
	        :wisdom => 1,
	        :charisma => 1
	    }
	}

	render plain: beast_structure.to_json

  end

  def get_price

    if params[:id].blank?
      raise ActiveRecord::RecordNotFound, "Beast not found."
    end

    id = params[:id]

    web3 = get_web3

    contract_info = Contract.where("name": "SALE_AUCTION").first
    if contract_info.blank?
      raise ActiveRecord::RecordNotFound, "Can't find contract."
    end

    auctionContract = web3.eth.contract(JSON.parse(contract_info.abi))

    auctions = auctionContract.at(contract_info.address)

    price = auctions.getCurrentPrice(id)

  	render json: {"price" => price}

  end
end
