class CreatePoddingsPoddings < ActiveRecord::Migration

  def up
    create_table :refinery_poddings do |t|
      t.integer :pod_id
      t.references :poddable, :polymorphic => true

      t.timestamps
    end
  end

  def down
    drop_table :refinery_poddings
  end

end
