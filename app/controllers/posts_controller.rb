class PostsController < ApplicationController
  before_filter :find_board
  
  # GET /posts
  # GET /posts.json
  def index
    redirect_to board_path(@board)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = @board.posts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = @board.posts.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = @board.posts.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = @board.posts.build(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to board_post_path(@board, @post), notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = @board.posts.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to board_post_path(@board, @post), notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = @board.posts.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to board_post_path(@board, @post) }
      format.json { head :no_content }
    end
  end
  
  protected
  def find_board
    @board = Board.find(params[:board_id])
  end
end
