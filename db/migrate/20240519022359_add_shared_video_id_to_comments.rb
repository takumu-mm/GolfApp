class AddSharedVideoIdToComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :comments, :shared_video, null: false, foreign_key: true
  end
end
