class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    @word = params[:word]
    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @books = Book.looks(params[:search], params[:word])
    end
  end

  def search_tag
    @word = params[:word]
    unless @word == ""
      @tag = Tag.find_by(tag_name: @word)
      @books = @tag.books
    else
      @books = Book.all
    end
  end
end
