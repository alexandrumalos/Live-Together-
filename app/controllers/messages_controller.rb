# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  text       :string
#  head       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /messages
  # GET /messages.json
  def index
    @messages = current_user.received_messages
    @messages = @messages.paginate(page: params[:page], per_page:5)
    @messages = @messages.to_a
    @messages.sort! {|left, right| right.created_at <=> left.created_at}
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create

    @message = Message.new(message_params)
    @message.sender = current_user
    @message.recipients << current_user
    to = params[:to]
    if to.nil?
      group = Group.find_by(id: params[:group_id])
      @message.groups << group
      to = []
      unless group.nil?
        group.users.each do |user|
          to << user.username
        end
      end
    else
      to = to.split(/\s*,\s*/)
    end
    to.each do |user_str|
      user = User.find_by(username: user_str)
      if user.nil?
        user = User.find_by(email: user_str)
      end
      unless user.nil?
        unless @message.recipients.include?(user)
          @message.recipients << user
        end
      end
    end

    respond_to do |format|
      if @message.save
        if group.nil?
          format.html { redirect_to messages_url, notice: 'Message was successfully created.' }
        else
          format.html { redirect_to group, notice: 'Message was successfully created.' }
        end
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.permit(:text, :head)
    end
end
