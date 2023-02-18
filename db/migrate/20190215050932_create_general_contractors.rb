class CreateGeneralContractors < ActiveRecord::Migration[5.2]
  def change
    create_table :general_contractors do |t|
      t.decimal :longitude, null: false, precision: 8, scale: 5
      t.decimal :latitude, null: false, precision: 8, scale: 5
      t.decimal :min_budget
      t.decimal :max_budget
      t.boolean :design_services, null: false, default: false
      t.boolean :build_services, null: false, default: false
      t.decimal :rating, default: 0
      t.integer :project_count, default: 0

      t.timestamps
    end
  end
end
