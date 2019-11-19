class WhateverChatsController < ApplicationController

  before_action :set_whatever_chat, only: [:show, :edit, :update, :destroy, :post_comment]
  skip_before_action :verify_authenticity_token

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
    @whatever_chats = WhateverChat.all.order('created_at DESC')
    @ad1_id = 1
    @ad2_id = 2
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
    @tags = ["love", "fashion", "happy"]
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
      @whatever_chat.to_user_id = "0"
    else
      puts "not nill"
      @whatever_chat.from_user_id = @current_user.username  
      puts @whatever_chat   
      puts @whatever_chat.to_user_id
      puts @whatever_chat.body
      if @whatever_chat.to_user_id == "0"
        @whatever_chat.tags = extract_tags(@whatever_chat.body)
        
      else
        puts "not reached"
      end
    end

    # extract tags from global posts, not private messages (to id is 0)
    
    
    #@tag.push("love")
    ##@tag.push("fashion")
    #@tag.push("beautiful")
    ##@tag.push("happy")
    #@tag.push("cute")
    #@tag.push("tbt")
    #@tag.push("whateverchat")

    #render json: {status: 'SUCCESS', message:'Loaded articles', body:whatever_chat},status: :ok

    respond_to do |format|
      if @whatever_chat.save
        # format.html { redirect_to @whatever_chat, notice: 'Whatever chat was successfully created.' }
        format.html { redirect_to "/whatever", notice: 'Whatever chat was successfully created.' }
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

    if @current_user.nil?
      @err_msg = 'Hey man seems like you\'re not logged in... '
      render :err, :layout => "application"
      return
    end

    @whatever_chats = WhateverChat.where(to_user_id: user_id)
  end

  def from
    username = params[:username]
    user = User.find_by(username: username)

    if user.nil?
      @err_msg = 'Nice try, but no such user exists...'
      render :err, :layout => "application"
      return
    end

    @whatever_chats = WhateverChat.where(from_user_id: username).order('created_at DESC')
    render :template => 'whatever_chats/index'
  end

  def vote
    username = params[:username]
    whatever_chat_id = params[:whatever_chat_id]
    operation = params[:operation]

    legal_operations = %w(up down neutral)

    user = User.find_by(username: username)
    if user.nil? || username == 'Global' || !legal_operations.include?(operation)
      puts 'illegal request to vote'
      head :ok
      return
    end

    v = Vote.find_by(username: username, whatever_chat_id: whatever_chat_id)
    if v.nil?
      p Vote.create(username:username, whatever_chat_id:whatever_chat_id, att:operation)
    else
      v.att = operation
      v.save
    end
    head :ok
  end

  def retwitte
    username = params[:username]
    original_id = params[:original_id]

    post = WhateverChat.find_by(id: original_id)
    user = User.find_by(username: username)
    if post.nil? || user.nil?
      head :ok
      return
    end

    WhateverChat.create(
      title: post.title,
      body: post.body,
      to_user_id: post.to_user_id,
      from_user_id: username,
      alias: post.alias,
      tags: post.tags,
      original_id: original_id
    )
    head :ok
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

    def extract_tags(text_body)
      puts "extracting tags"
      tokens = text_body.gsub(/\s+/m, ' ').strip.split(" ")
      puts tokens
      result = ""
      tokens.each do |tok|
        if tok[0] == "#"
          tok = tok[1, tok.length]
          result += tok + ","
        end
        
      end
      return result
      
    end
end
