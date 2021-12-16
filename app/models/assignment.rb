class Assignment < ApplicationRecord
  belongs_to :platform
  belongs_to :train
  
  validate :is_valid
  validate :is_too_long
  validate :is_available

  def duration
    (self.departure - self.arrival)/60
  end

  def is_valid
    errors.add(:arrival, "must occur before departure") if self.duration <= 0
  end

  def is_too_long
    if self.duration > 20
      errors.add(:duration, "can't be longer than 20 minutes")
    end
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

# def no_duplicate_schedules
#   platform = Platform.find(platform_id)
#   platform.assignments.each do |assignment|
#     if ((arrival >= assignment.arrival && arrival <= assignment.departure ) || ( departure >= assignment.arrival  &&  departure <= assignment.departure ))
#       errors.add(:arrival, "Trains cannot have overlapping schedules.")
#     elsif (( assignment.arrival >= arrival  &&  assignment.arrival <= departure  ) || (  assignment.departure >= arrival  &&  assignment.departure <= departure  ))
#       errors.add(:arrival, "Trains cannot have overlapping schedules.")
#     end
#   end
# end