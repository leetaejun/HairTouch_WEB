class CreateProcedureDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :procedure_details do |t|
      t.references :procedure_category, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
