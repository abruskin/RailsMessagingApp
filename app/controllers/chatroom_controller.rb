class ChatroomController < ApplicationController
  before_action :require_user
  def index
    @messages = Message.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
end