class CreateVideos < ActiveRecord::Migration[7.1]
  def change
    create_table :videos do |t|
      t.string :youtube_video_id
      t.string :title
      t.string :channel_name
      t.integer :view_count
      t.integer :like_count

      t.timestamps
    end
  end
end
