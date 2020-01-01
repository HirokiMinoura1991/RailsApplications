class TestJob < ApplicationJob
  queue_as :default
    def perform(*args)
      Rails.longger.debug "#{self.class.name}: ジョブを実行しました(#{args.inspect})"
    end
end
