class RequestTask < ActiveRecord::Base
  belongs_to :requester
  has_many :micro_tasks
  validates_numericality_of :budget, :greater_than => 10, :format => /^([1-9]\d{0,5}|0)(\.\d{1,2})?$/
  validates :translation_text, :length => { :minimum => 50 },
                               :format => { :with => /\w/ }
  validates :to, :from, :presence => true
  after_save :split_into_tasks
  private
  def split_into_tasks
    translation_micro_task = self.translation_text.split('.')
    size = translation_micro_task.size
    credit = self.budget/size
    credit = 0.8 * credit
    task_id = self.id
    status = "pending"
    i = 0
    while i< size
      translation_microtask = translation_micro_task[i]
      @request_task = RequestTask.find(task_id)
      @request_task.micro_tasks.create(:credit =>credit, :status =>status, :translation_microtask =>translation_microtask)
      #MicroTask.create(:task_id => task_id, :credit =>credit, :status => status, :translation_microtask => translation_microtask)
      i = i+1
    end
  end
end
