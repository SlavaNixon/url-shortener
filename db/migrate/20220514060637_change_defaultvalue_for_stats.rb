class ChangeDefaultvalueForStats < ActiveRecord::Migration[7.0]
  def change
    change_column_default :urls, :stats, 0
  end
end
