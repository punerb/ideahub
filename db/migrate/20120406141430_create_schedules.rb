class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :idea
      t.datetime   :scheduled_at
      t.string     :location
      t.timestamps
    end
  end
end
