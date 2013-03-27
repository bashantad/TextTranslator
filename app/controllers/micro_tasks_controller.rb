class MicroTasksController < ApplicationController
  # GET /micro_tasks
  # GET /micro_tasks.json
  layout 'user_layout'
  def index
    @micro_tasks = MicroTask.where(:request_task_id=>params[:request_task_id]).paginate(:page => params[:page], :per_page => 20)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @micro_tasks }
    end
  end
  def show_tasks
    @current_tasks = current_user.micro_tasks.where(:status =>params[:status]).paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html # show_tasks.html.erb
      format.json { render json: @current_tasks }
    end
  end
  def search
    lang_to = params[:micro_task][:to]
    lang_from = params[:micro_task][:from]
    if lang_to!='' && lang_from!=''
      task_ids = RequestTask.find(:all, :select=>'id', conditions:{:to=>lang_to, :from =>lang_from}).collect(&:id) 
      @filtered_tasks = MicroTask.where("request_task_id in (?)",task_ids).paginate(:page =>params[:page],:per_page =>10)
    else
      @filtered_tasks = MicroTask.where(:status => 'pending').paginate(:page => params[:page], :per_page => 10)
    end
    respond_to do |format|
      format.html
    end
  end
  def change_status
    @micro_task = MicroTask.find(params[:id])
    @micro_task.status = params[:status]
    respond_to do |format|
      if @micro_task.save
        if @micro_task.status == 'approved'
          worker_id = @micro_task.user_id
          @user = User.find(worker_id)
          @user.credit = @user.credit + @micro_task.credit
          @user.save
        end
        format.html {redirect_to request_task_micro_tasks_path(@micro_task.request_task_id)}
        #format.js
      end
    end 
  end
  def translate
    @micro_task = MicroTask.find(params[:id])
    @micro_task.status = params[:status]
    @micro_task.user_id = current_user.id
    respond_to do |format|
      if @micro_task.save
        format.html
      end
    end
  end
  def do_translate
    @micro_task = MicroTask.find(params[:id])
    flash[:alert] = "Translation task done"
    respond_to do |format|
      if @micro_task.update_attributes(params[:micro_task])
        @micro_task.status = params[:status]
        if @micro_task.save
          format.html{ redirect_to user_root_path }
        end
      end
    end
  end
end
