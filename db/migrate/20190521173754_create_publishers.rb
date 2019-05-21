class CreatePublishers < ActiveRecord::Migration[6.0]
  def change
    create_table :publishers do |t|
      t.string :name, null: false, index: true
      t.text :description, null: true

      t.timestamps
    end
  end
end
