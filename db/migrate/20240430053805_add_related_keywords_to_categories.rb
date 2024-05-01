class AddRelatedKeywordsToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :related_keywords, :text
  end
end
