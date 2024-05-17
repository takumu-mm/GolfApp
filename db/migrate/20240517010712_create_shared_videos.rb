class CreateSharedVideos < ActiveRecord::Migration[7.1]
  def change
    create_table :shared_videos do |t|
      t.integer :user_id
      t.integer :video_id
      t.text :body

      t.timestamps
    end
  end
end
