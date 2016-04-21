# == Schema Information
#
# Table name: posts
#
#  id              :integer          not null, primary key
#  body            :text
#  score           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  neighborhood_id :integer
#  title           :string
#

class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :update_category, :destroy, :upvote, :downvote, :comment]
  before_action :authenticate_user!

  # GET /posts
  # GET /posts.json
  def index
    if current_user.current_neighborhood.nil?
      flash[:notice] = "Cannot view posts: No neighborhood is currently active"
      redirect_to neighborhoods_url
    end

    if current_user.current_neighborhood.nil?
      @posts = nil
    else
      @posts = current_user.current_neighborhood.posts.to_a
      parent = current_user.current_neighborhood.parent
      until parent.nil?
        parent_posts = parent.posts.to_a
        parent_posts.each do |post|
          if isNewser(post.user)
            @posts.push(post)
          end
        end
        parent = parent.parent
      end
      @posts.sort! {|left, right| right.created_at <=> left.created_at}
    end
    @post = Post.new
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.neighborhood = current_user.current_neighborhood
    @post.neighborhood.posts << @post
    @post.score = 0;

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_url }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :index }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def reload_posts
    if current_user.current_neighborhood.nil?
      @posts = nil
    else
      if params[:category] == '-1'
        @posts = current_user.current_neighborhood.posts
      else
        @posts = current_user.current_neighborhood.posts.where(category: params[:category])
      end
    end

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.js
    end
  end

  def update_category
    if @post.neighborhood.leads.include?(current_user)
      @post.category_id = post_params[:category_id]

      respond_to do |format|
        if @post.save
          format.html { redirect_to posts_url, notice: 'Post was successfully updated.' }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'Must be a lead to edit category.' }
        format.json { render :show, status: :ok, location: @post }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @post.score = @post.score + 1
    update_lead_status(@post.user, @post.neighborhood, 1)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_url }
        format.js
      end
    end
  end

  def downvote
    @post.score = @post.score - 1
    update_lead_status(@post.user, @post.neighborhood, -1)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_url }
        format.js
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :category_id, :comment)
    end
end
