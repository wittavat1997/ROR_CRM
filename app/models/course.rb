class Course < ApplicationRecord
  belongs_to :user
  belongs_to :classroom
  belongs_to :serives
  has_many :lessons
  
  include Schedulable
  
  def schedule
    schedule = IceCube::Schedulable.new(now = self.start_time.to_datetime)
    schedule.add_recurrence_rule(
      IceCube::Rule.weekly.day(active_days)
      )
      schedule
  end
end
