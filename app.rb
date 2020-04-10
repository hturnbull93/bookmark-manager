# frozen_string_literal: true

require 'pg'
require 'uri'

require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'
require './database_connection_setup'

# The class for Sinatra to use
class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/bookmarks' do
    unless Bookmark.create(url: params[:url], title: params[:title])
      flash[:notice] = 'You must submit a valid URL'
    end
    redirect '/bookmarks'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    unless Bookmark.update(id: params[:id], url: params[:url], title: params[:title])
      flash[:notice] = 'You must submit a valid URL'
    end
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/comments/new' do
    @bookmark_id = params[:id]
    erb :'comments/new'
  end

  post '/bookmarks/:id/comments' do
    # Comment.create(text: params[:comment], bookmark_id: params[:id])
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO comments (bookmark_id, text)
                          VALUES ('#{params[:id]}', '#{params[:comment]}');")
    redirect '/bookmarks'
  end
end
