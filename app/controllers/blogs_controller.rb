class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  # we can define a special layout which will be used for blogs pages by using this.
  layout "blog"

  # this is a definition for petergate. That means  => everyone can access show and index pages. User's(they can only
  # write a comment) cannot access destroy, new, create, edit and update pages. And site_admin can access everywhere.
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :edit, :update, :toggle_status]}, site_admin: :all

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.page(params[:page]).per(5)
    # we can change page title variable everywhere. Because we defined it in application_controller. So every
    # controller can reach it. And here we are changing the default value so in blog index page the title
    # will be shown like down here.
    @page_title = "My Blog | Ali Bulut"
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    # we can even define a dynamic value for blog_title variable.
    @page_title = @blog.title
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_status
    # by using byebug we can debug our code and ask questions on terminal about that.
    #byebug
    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end
    redirect_to blogs_url, notice: 'Post status has been updated!'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      # fetching blog from params which is coming from html form and only allow to pass title and body to controller.
      params.require(:blog).permit(:title, :body)
    end
end
