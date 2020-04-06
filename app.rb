# frozen_string_literal: true

require 'sinatra/base'

# The class for Sinatra to use
class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/bookmarks' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = [
      'http://www.makersacademy.com',
      'http://www.destroyallsoftware.com',
      'http://www.google.com'
    ]
    erb :'bookmarks/index'
  end
end
