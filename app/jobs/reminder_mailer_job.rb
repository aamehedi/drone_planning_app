class ReminderMailerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Mission.after_a_week.each do |mission|
      #TODO: Send email for each mission
    end
    Mission.today.each do |mission|
      #TODO: Send email for each mission
    end
  end
end
