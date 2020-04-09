# frozen_string_literal: true

require 'pg'

class Bookmark
  def self.all
    connection = connection_type
    result = connection.exec('SELECT * FROM bookmarks;')
    result.map { |bookmark| bookmark['url'] }
  end

  def self.create(url:, title:)
    connection = connection_type
    connection.exec("INSERT INTO bookmarks (title, url)
                          VALUES ('#{title}', '#{url}')
                       RETURNING id, url, title")
  end

  def self.connection_type
    db = ENV['ENVIRONMENT'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
    PG.connect(dbname: db)
  end

end
