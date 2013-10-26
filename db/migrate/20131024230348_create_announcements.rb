class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :heading
      t.string :body

      t.timestamps
    end
  end
end
