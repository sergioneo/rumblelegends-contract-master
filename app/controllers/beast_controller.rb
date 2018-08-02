class BeastController < ApplicationController
  def get_information

  	id = params[:id]

  	beast_mock = {
	    :race => 0,
	    :genes => ["151035040544608783460", 
	    		   "151035040544575359108", 
	    		   "151035040475889435746", 
	    		   "151035040475854832738", 
	    		   "446182945655207658594", 
	    		   "446182945655211820130"].sample,
	    :experience => 0,
	    :challengeCoolDown => 0,
	    :birthTime => 1533220228,
	    :cooldownEndBlock => 0,
	    :sireId => 232434,
	    :matronId => 234234,
	    :siringWithId => 0,
	    :cooldownIndex => 0,
	    :generation => 0,
	    :skillId => 0,
	    :level => 1,
	    :preferedAttribute => 0,
	    :element => 0,
	    :pedigree => 1,
	    :attrs => {
	        :strength => 1,
	        :dexterity => 1,
	        :endurance => 1,
	        :knowledge => 1,
	        :wisdom => 1,
	        :charisma => 1
	    }
	}

	render plain: beast_mock.to_json

  end
end
