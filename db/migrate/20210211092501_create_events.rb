class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
