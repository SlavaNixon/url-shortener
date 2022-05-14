class AddSmallUrlToUrls < ActiveRecord::Migration[7.0]
  def change
    add_column :urls, :small_url, :string
  end
end
