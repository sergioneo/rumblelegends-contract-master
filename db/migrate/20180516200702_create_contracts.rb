class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.string :name
      t.string :abi
      t.string :address

      t.timestamps
    end
  end
end
