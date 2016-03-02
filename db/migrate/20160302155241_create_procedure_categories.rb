class CreateProcedureCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :procedure_categories do |t|
      t.references :procedure, foreign_key: true
      t.integer :gender_id
      t.integer :length_id
      t.integer :category_id
      t.integer :category_detail_id

      t.timestamps
    end
  end
end
