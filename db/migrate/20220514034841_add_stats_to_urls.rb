class AddStatsToUrls < ActiveRecord::Migration[7.0]
  def change
    add_column :urls, :stats, :integer
  end
end
