class AddPositionToPortfolio < ActiveRecord::Migration[5.0]
  def change
    add_column :portfolis, :position, :integer
  end
end
