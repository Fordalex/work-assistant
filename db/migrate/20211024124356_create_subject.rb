class CreateSubject < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.references :user
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
