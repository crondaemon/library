class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = current_institute.books.ordered
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_institute.books.build(book_params)

    if @book.save
      respond_to do |format|
        format.html{ redirect_to books_path, notice: "Book was successfully created." }
        format.turbo_stream{ flash.now[:notice] = "Book was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      respond_to do |format|
        format.html{ redirect_to books_path, notice: "Book was successfully updated." }
        format.turbo_stream{ flash.now[:notice] = "Book was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy

    respond_to do |format|
      format.html{ redirect_to books_path, notice: "Book was successfully destroyed." }
      format.turbo_stream{ flash.now[:notice] = "Book was successfully destroyed." }
    end
  end

  private

  def set_book
    @book = current_institute.books.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :authors)
  end
end
