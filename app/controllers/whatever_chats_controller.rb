class WhateverChatsController < ApplicationController
  before_action :set_whatever_chat, only: [:show, :edit, :update, :destroy]

  # GET /whatever_chats
  # GET /whatever_chats.json
  def index
    @whatever_chats = WhateverChat.all
  end

  # GET /whatever_chats/1
  # GET /whatever_chats/1.json
  def show
  end

  # GET /whatever_chats/new
  def new
    @whatever_chat = WhateverChat.new
  end

  # GET /whatever_chats/1/edit
  def edit
  end

  # POST /whatever_chats
  # POST /whatever_chats.json
  def create
    @whatever_chat = WhateverChat.new(whatever_chat_params)

    respond_to do |format|
      if @whatever_chat.save
        format.html { redirect_to @whatever_chat, notice: 'Whatever chat was successfully created.' }
        format.json { render :show, status: :created, location: @whatever_chat }
      else
        format.html { render :new }
        format.json { render json: @whatever_chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /whatever_chats/1
  # PATCH/PUT /whatever_chats/1.json
  def update
    respond_to do |format|
      if @whatever_chat.update(whatever_chat_params)
        format.html { redirect_to @whatever_chat, notice: 'Whatever chat was successfully updated.' }
        format.json { render :show, status: :ok, location: @whatever_chat }
      else
        format.html { render :edit }
        format.json { render json: @whatever_chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /whatever_chats/1
  # DELETE /whatever_chats/1.json
  def destroy
    @whatever_chat.destroy
    respond_to do |format|
      format.html { redirect_to whatever_chats_url, notice: 'Whatever chat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_whatever_chat
      @whatever_chat = WhateverChat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def whatever_chat_params
      params.fetch(:whatever_chat, {})
    end
end
