class CreateMegaliths < ActiveRecord::Migration[6.0]
  def change
    create_table :megaliths do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :category
      t.text :description
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
