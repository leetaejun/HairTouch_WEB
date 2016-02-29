class CreateDesignerAuths < ActiveRecord::Migration[5.0]
  def change
    create_table :designer_auths do |t|
      t.references :designer, foreign_key: true
      t.text :access_token

      t.timestamps
    end
  end
end
