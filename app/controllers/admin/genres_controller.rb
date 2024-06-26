class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path, notice: "You have created genre successfully."
    else
      flash.now[:notice] = "create genre error"
      @genres = Genre.all
      render :index
    end

  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
    redirect_to admin_genres_path, notice: "You have updated genre successfully."
    else
    flash.now[:notice] = "update genre error"
    render :edit
    end
  end
    private
  # ストロングパラメータ
  def genre_params
    params.require(:genre).permit(:name)
  end
end
