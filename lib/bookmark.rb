# frozen_string_literal: true

require 'pg'

class Bookmark
  def self.all
    # Connect
    connection = PG.connect(dbname: 'bookmark_manager')
    # Execute query
    result = connection.exec("SELECT * FROM bookmarks;")
    # Map through array, table row is a hash, extract the value from the url key into an array
    result.map { |bookmark| bookmark['url'] }
  end
end
