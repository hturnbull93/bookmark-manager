# frozen_string_literal: true

require 'sinatra/base'

# The class for Sinatra to use
class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark Manager!'
  end
end
