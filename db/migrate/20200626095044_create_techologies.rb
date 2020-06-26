class CreateTechologies < ActiveRecord::Migration[6.0]
  def change
    create_table :techologies do |t|
      t.string :name
      t.references :portfolio,  foreign_key: true

      t.timestamps
    end
  end
end
