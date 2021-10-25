class CreateMemberGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :member_groups do |t|
      t.references :member
      t.references :ticket

      t.timestamps
    end
  end
end
