class AddSearchKeywordToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :search_keyword, :string
  end
end
