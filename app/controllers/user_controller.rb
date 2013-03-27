class UserController < ApplicationController
   before_filter :authenticate_user!
   layout 'user_layout'
  def index
    if params[:micro_task] == nil
      @micro_tasks = MicroTask.where(:status => 'pending').paginate(:page => params[:page], :per_page => 10)
    else
      lang_to = params[:micro_task][:to]
      lang_from = params[:micro_task][:from]
      task_ids = RequestTask.find(:all, :select=>'id', conditions:{:to=>lang_to, :from =>lang_from})
      @micro_tasks = MicroTask.find(task_ids)
      binding.pry
      
    end
  end
end
