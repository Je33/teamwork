class EventController < WebsocketRails::BaseController

  def client_connected
    send_message 'client_connected', {status: "Connected"}
  end

  def index
    tasks = Task.all
    trigger_success task
  end

  def create
    task = Task.new(message)
    if task.save
      broadcast_message :create_task, task
      trigger_success task
    else
      trigger_failure task
    end
  end

  def update
    task = Task.find(message[:id])
    if task.update_attributes(message)
      broadcast_message :update_task, task
      trigger_success task
    else
      trigger_failure task
    end
  end

  def destroy
    task = Task.find(message[:id])
    if task.destroy
      broadcast_message :destroy_task, task
      trigger_success task
    else
      trigger_failure task
    end
  end

end