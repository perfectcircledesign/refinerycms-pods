class CreatePodsPods < ActiveRecord::Migration

  def up
    create_table :refinery_pods do |t|
      t.string :title
      t.text :body
      t.string :url
      t.integer :image_id
      t.string :pod_type
      t.integer :gallery_id
      t.integer :video_id
      t.date :start_date
      t.date :expiry_date
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-pods"})
    end

    drop_table :refinery_pods

  end

end
