class BooksController < ApplicationController

	before_action :authenticate_user!

  def index

  	@book = Book.all
  	@user = User.find(current_user.id)
  	@post = Book.new
  end

  def show

  	@book = Book.find(params[:id])
  	@post = Book.new

  end

  def edit

  	@book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    end

  end

  def update

  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  		redirect_to book_path(@book.id), notice: "You have updated book successfully."
  	else
  		render :edit
  	end

  end

  def create

  	@post = Book.new(book_params)
  	@post.user_id = current_user.id
  	if @post.save
  	 redirect_to book_path(@post.id), notice: "You have created book successfully."
  	else
      @user = User.find(current_user.id)
      @book = Book.all
  		render :index
  	end

  end

  def destroy

  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to books_path

  end

  private

  def book_params

  	params.require(:book).permit(:title, :body)

  end
end
