require 'test_helper'

class MicroTasksControllerTest < ActionController::TestCase
  setup do
    @micro_task = micro_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:micro_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create micro_task" do
    assert_difference('MicroTask.count') do
      post :create, micro_task: @micro_task.attributes
    end

    assert_redirected_to micro_task_path(assigns(:micro_task))
  end

  test "should show micro_task" do
    get :show, id: @micro_task.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @micro_task.to_param
    assert_response :success
  end

  test "should update micro_task" do
    put :update, id: @micro_task.to_param, micro_task: @micro_task.attributes
    assert_redirected_to micro_task_path(assigns(:micro_task))
  end

  test "should destroy micro_task" do
    assert_difference('MicroTask.count', -1) do
      delete :destroy, id: @micro_task.to_param
    end

    assert_redirected_to micro_tasks_path
  end
end
