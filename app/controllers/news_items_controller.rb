class NewsItemsController < ApplicationController
  before_action :set_news_item, only: [:show, :edit, :update, :destroy]

  # GET /news_items
  # GET /news_items.json
  def index
    @news_items = NewsItem.all
  end

  # GET /news_items/1
  # GET /news_items/1.json
  def show
  end

  # GET /news_items/new
  def new
    @news_item = NewsItem.new
  end

  # GET /news_items/1/edit
  def edit
  end

  # POST /news_items
  # POST /news_items.json
  def create
    @news_item = NewsItem.new(news_item_params)

    respond_to do |format|
      if @news_item.save
        format.html { redirect_to @news_item, notice: 'News item was successfully created.' }
        format.json { render :show, status: :created, location: @news_item }
      else
        format.html { render :new }
        format.json { render json: @news_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news_items/1
  # PATCH/PUT /news_items/1.json
  def update
    @news_item = NewsItem.find( params[:id] )

    @news_item.destroy

    redirect_to anews_items_path
  end

  # DELETE /news_items/1
  # DELETE /news_items/1.json
  def destroy
    @news_item = NewsItem.find( params[:id] )

    @news_item.destroy

    redirect_to news_items_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news_item
      @news_item = NewsItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_item_params
      params.require(:news_item).permit(:title, :sub_header, :content, :image)
    end
end
