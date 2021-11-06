class CreateSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :settings do |t|
      t.references :user
      t.string :theme, default: "light"

      t.timestamps
    end
  end
end
