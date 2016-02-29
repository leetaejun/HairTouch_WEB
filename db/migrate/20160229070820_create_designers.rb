class CreateDesigners < ActiveRecord::Migration[5.0]
  def change
    create_table :designers do |t|
      t.string :email
      t.string :password
      t.string :nickname

      t.timestamps
    end
  end
end
