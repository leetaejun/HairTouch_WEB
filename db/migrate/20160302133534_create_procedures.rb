class CreateProcedures < ActiveRecord::Migration[5.0]
  def change
    create_table :procedures do |t|
      t.references :designer, foreign_key: true
      t.integer :hair_length_id
      t.integer :hair_category_id
      t.text :title
      t.text :subtitle
      t.text :content

      t.timestamps
    end
  end
end
