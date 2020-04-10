# frozen_string_literal: true

require 'pg'

class Bookmark
  def self.all
    connection = connection_type
    result = connection.exec('SELECT * FROM bookmarks;')
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.create(url:, title:)
    connection = connection_type
    result = connection.exec("INSERT INTO bookmarks (title, url)
                                   VALUES ('#{title}', '#{url}')
                                RETURNING id, url, title")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.connection_type
    db = ENV['ENVIRONMENT'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
    PG.connect(dbname: db)
  end

  def self.delete(id:)
    connection = connection_type
    connection.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.update(id:, title:, url:)
    connection = connection_type
    result = connection.exec("UPDATE bookmarks
                                 SET url = '#{url}', title = '#{title}'
                               WHERE id = '#{id}'
                           RETURNING id, url, title;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.find(id:)
    connection = connection_type
    result = connection.exec("SELECT * FROM bookmarks WHERE id = #{id}")
    Bookmark.new(id: result[0]['id'], url: result[0]['url'], title: result[0]['title'])
  end

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  attr_reader :id, :title, :url
end
