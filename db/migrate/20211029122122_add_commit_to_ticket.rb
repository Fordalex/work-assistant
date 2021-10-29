class AddCommitToTicket < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :commit, :string
    add_column :tickets, :resource, :string
  end
end
