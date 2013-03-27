class MicroTask < ActiveRecord::Base
  belongs_to :request_task
  belongs_to :user
  validate :translated_microtask, :presence => true
end
