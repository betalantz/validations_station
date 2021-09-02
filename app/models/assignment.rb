class Assignment < ApplicationRecord
  belongs_to :platform
  belongs_to :train

  validate :is_too_long
  validate :is_available

  def is_too_long
    if self.duration > 20
      errors.add(:duration, "can't be longer than 20 minutes")
    end
  end

  def duration
    (self.departure - self.arrival)/60
  end

  def is_available
    assignments = self.platform.assignments
    assignments.each do |assignment|
      if assignment.arrival <= self.arrival && self.arrival <= assignment.departure || self.arrival <= assignment.arrival && assignment.arrival <= self.departure
        errors.add(:platform, "is occupied")
      end
    end
  end
end
