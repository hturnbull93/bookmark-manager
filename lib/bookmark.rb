# frozen_string_literal: true

require_relative 'database_connection'

class Bookmark
  def self.all
    result = DatabaseConnection.query('SELECT * FROM bookmarks;')
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.create(url:, title:)
    return false unless url?(url)

    result = DatabaseConnection.query("INSERT INTO bookmarks (title, url)
                                            VALUES ('#{title}', '#{url}')
                                         RETURNING id, url, title")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.update(id:, title:, url:)
    return false unless url?(url)

    result = DatabaseConnection.query("UPDATE bookmarks
                                          SET url = '#{url}', title = '#{title}'
                                        WHERE id = '#{id}'
                                    RETURNING id, url, title;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id}")
    Bookmark.new(id: result[0]['id'], url: result[0]['url'], title: result[0]['title'])
  end

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  attr_reader :id, :title, :url

  def comments
    DatabaseConnection.query("SELECT * FROM comments
                               WHERE bookmark_id = #{@id};")
  end

  private

  def self.url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end
end
