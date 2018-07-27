class KeywordsController < ApplicationController

  def index
    @keywords = Keyword.all
  end

  def show
    @keyword = Keyword.find(params[:id])
  end

  def new
    @keyword = Keyword.new
  end

  def create
    @keyword = Keyword.new(key_params)
    @keyword.save
    redirect_to @keyword
  end

  def edit
    @keyword = Keyword.find(params[:id])
  end

  def update
    @keyword= Keyword.find(params[:id])
    if @keyword.update(key_params)
      redirect_to keywords_path
    else
      render :edit
    end
  end

  def destroy
    @keyword = Keyword.find(params[:id])
    @keyword.destroy
    redirect_to keywords_path
  end

  private

  def key_params
    params.require(:keyword).permit(:word)
  end

end
