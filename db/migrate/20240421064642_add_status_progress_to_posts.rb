class AddStatusProgressToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :notes, :status_progress, :integer
  end
end
