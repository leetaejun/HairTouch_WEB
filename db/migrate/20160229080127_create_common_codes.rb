class CreateCommonCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :common_codes do |t|
      t.string :main_code
      t.integer :detail_code
      t.string :detail_name

      t.timestamps
    end
  end
end
