class WhateverChatsController < ApplicationController

  before_action :set_whatever_chat, only: [:show, :edit, :update, :destroy, :post_comment]

  # GET /whatever_chats
  # GET /whatever_chats.json
  def index
    @current_user ||= User.find_by(id: session[:user_id])
    puts @current_user
    if @current_user.nil?
      puts "nill"
    else
      puts "not nill"
      puts @current_user.username      
    end
    @whatever_chats = WhateverChat.all
  end

  # GET /whatever_chats/1
  # GET /whatever_chats/1.json
  def show
    @id = params[:id]
    @whatever_chat = WhateverChat.find(@id)
    if @whatever_chat.from_user_id.nil? 
      @loggedIn = false
      @nameToDisplay = @whatever_chat.alias
    else 
      @loggedIn = false
      @nameToDisplay = @whatever_chat.from_user_id
    end
    @comments = @whatever_chat.comments 
  end

  # GET /whatever_chats/new
  def new
    @current_user ||= User.find_by(id: session[:user_id])
    @whatever_chat = WhateverChat.new
  end

  # GET /whatever_chats/1/edit
  def edit
  end

  # POST /whatever_chats
  # POST /whatever_chats.json
  def create
    params.permit!
    @whatever_chat = WhateverChat.new(whatever_chat_params)
    @current_user ||= User.find_by(id: session[:user_id])
    if @current_user.nil?
      puts "Unauth user"
    else
      puts "not nill"
      @whatever_chat.from_user_id = @current_user.username  
      puts @whatever_chat    
    end
    
    #render json: {status: 'SUCCESS', message:'Loaded articles', body:whatever_chat},status: :ok

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

  # POST /whatever_chats/1
  # POST /whatever_chats/1.json
  def post_comment
    params.permit!
    @comment = Comment.new(comment_params)
  end


  def show_comment
    puts @whatever_chat.id
    #respond_to do |format|
      #format.html { redirect_to "/posPt/"}
  end

  def to_me
    user_id = session[:user_id]
    @current_user = User.find_by(id: user_id)
    render :to_me_err, :layout => "application" if @current_user.nil?

    @whatever_chats = WhateverChat.where(to_user_id: user_id)
    puts '--------------------------'
    puts @whatever_chats.inspect
    puts '--------------------------'
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

    def comment_params
      params.fetch(:comment, {})
    end
end
