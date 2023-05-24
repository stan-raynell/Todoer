class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :title, limit: 255
      t.boolean :checked, default: false
      t.references :list, null: false, foreign_key: true
      t.timestamps
    end
  end
end
