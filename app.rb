# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmark'
require 'pg'

# The class for Sinatra to use
class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/bookmarks' do
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    url = params[:url]
    connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url}')")
    redirect '/bookmarks'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end
end
