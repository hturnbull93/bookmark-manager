# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmark'

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
    "https://github.com"
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end
end
