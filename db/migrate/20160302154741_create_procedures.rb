class CreateProcedures < ActiveRecord::Migration[5.0]
  def change
    create_table :procedures do |t|
      t.references :designer, foreign_key: true
      t.text :title
      t.text :subtitle
      t.text :content

      t.timestamps
    end
  end
end
