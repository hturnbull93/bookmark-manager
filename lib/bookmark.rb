# frozen_string_literal: true

require 'pg'

class Bookmark
  def self.all
    connection = self.connection_type
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url'] }
  end

  def self.create(url:)
    connection = self.connection_type
    connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url}')")
  end

  def self.connection_type
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'bookmark_manager_test')
    else
      PG.connect(dbname: 'bookmark_manager')
    end
  end
end
