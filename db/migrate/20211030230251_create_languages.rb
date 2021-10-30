class CreateLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :languages do |t|
      t.name
      t.references :user

      t.timestamps
    end
  end
end
