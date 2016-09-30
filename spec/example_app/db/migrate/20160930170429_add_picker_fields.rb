class AddPickerFields < ActiveRecord::Migration
  def change
    add_column :customers, :favorite_color, :string, null: false, default: "#000000"
    add_column :customers, :favorite_font, :string
    add_column :products, :description_html, :text
  end
end
