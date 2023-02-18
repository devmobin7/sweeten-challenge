class CreateContract < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.references :general_contractor
      t.references :renovation_project
      t.integer :status, default: 1
      t.integer :rating, default: 0

      t.timestamps
    end
  end
end
