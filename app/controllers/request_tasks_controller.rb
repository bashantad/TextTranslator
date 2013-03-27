class RequestTasksController < ApplicationController
  # GET /projects/new
   # GET /projects/new.json
   before_filter :authenticate_requester!
   def index
    @request_tasks = current_requester.request_tasks.paginate(:page => params[:page], :per_page => 4)
    respond_to do |format|
       format.html # index.html.erb
       format.json { render json: @request_tasks }
     end
   end
   def new
     @request_task = RequestTask.new
     respond_to do |format|
       format.html # new.html.erb
       format.json { render json: @request_task }
     end
   end
   def create
      @request_task = current_requester.request_tasks.new(params[:request_task])
      respond_to do |format|
        if check_credit_available
          @request_task.save 
          format.html { redirect_to @request_task, notice: 'New work is successfully created.' }
          format.json { render json: @request_task, status: :created, location: @request_task }
        else
          format.html { render action: "new" }
          format.json { render json: @request_task.errors, status: :unprocessable_entity }
        end
      end
    end
    def show
      @request_task = current_requester.request_tasks.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @request_task }
      end
    end
    def destroy
     @request_task = current_requester.request_tasks.find(params[:id])
     @request_task.destroy
    end
    private 
    def check_credit_available
      if current_requester.credit < params[:request_task][:budget].to_f
        flash[:notice] = "You don't have sufficient balance to create new task"
        false
      else
        current_requester.credit = current_requester.credit - params[:request_task][:budget].to_f
        current_requester.save
      end
    end
end
