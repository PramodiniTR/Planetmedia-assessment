class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_task, only: %i[show update destroy]

    def index
        tasks = current_user.tasks.page(params[:page]).per(3)
        render json: tasks, each_serializer: TaskSerializer, status: :ok
    end
    
    def show
        render json: @task, serializer: TaskSerializer, status: :ok
    end
    
    def create
        task = current_user.tasks.build(task_params)
        if task.save
            render json: task, serializer: TaskSerializer, meta: { message: "Task created successfully" }, status: :created
        else
            render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        if @task.update(task_params)
            render json: @task, serializer: TaskSerializer, meta: { message: "Task updated successfully" }, status: :ok
        else
            render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
        end
    end
    
    def destroy
        @task.destroy
        render json: { message: "Task deleted successfully" }, status: :ok
    end
    
    private

    def set_task
        @task = current_user.tasks.find_by(id: params[:id])
        render json: { error: "Task not found" }, status: :not_found unless @task
    end

    def task_params
        params.require(:task).permit(:title, :description, :status, :due_date)
    end

    def authenticate_user!
        token = request.headers['Authorization']&.split(' ')&.last
        payload = JWT.decode(token, Rails.application.secret_key_base)[0] rescue nil
        @current_user = User.find_by(id: payload['sub']) if payload
        render json: { error: "Unauthorized" }, status: :unauthorized unless @current_user
      end
     

      headersk
      
    def current_user
        @current_user
    end
end
