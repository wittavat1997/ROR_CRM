class ChangeScheduleStartTimeToDatetime < ActiveRecord::Migration[7.0]
  def change
    remove_column :courses, :start_time
    add_column :courses, :start_time, :time
  end
end
