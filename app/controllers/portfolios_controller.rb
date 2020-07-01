class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only:[:edit, :update, :show, :destroy]
  layout "portfolio"

  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :edit, :update, :toggle_status, :sort]}, site_admin: :all

  def index
    # we can reach angular method from portfolio model. We created a query from there and we can reach from here
    # without writing any query.
    # @portfolio_items = Portfolio.angular
    # @portfolio_items = Portfolio.ruby_on_rails_portfolio_items
    # @portfolio_items = Portfolio.all
    # 
    # that means portfolio items will be ordered by position field in database as ascending.
    # @portfolio_items = Portfolio.order("position ASC")
     @portfolio_items = Portfolio.by_position 
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end

    # by writing this we are telling rails, dont look for view for this controller, here we are just communicating
    # with database.
    render nothing: true
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def show
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live!' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      # we use url here instead of path because destroy method has no any view that means also has no any route or path
      # so we have to write the whole url for redirecting.
      format.html { redirect_to portfolios_url, notice: 'Record was successfully removed.' }
    end
  end

  private

  def portfolio_params
    # _destroy is special that is coming from cocoon
    params.require(:portfolio)
        .permit(:title, :subtitle, :thumb_image, :main_image, :body, techologies_attributes: [:id, :name, :_destroy])
  end

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end
end
