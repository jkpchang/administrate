class RenameDescriptionHtmlColumn < ActiveRecord::Migration
  def change
    rename_column :products, :description_html, :features
  end
end
