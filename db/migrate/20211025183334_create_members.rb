class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :colour
      t.references :user
      t.references :subject_group

      t.timestamps
    end
  end
end
