require './spec/database_helpers.rb'

require 'comment'
require 'bookmark'

describe Comment do
  describe '.create' do
    it 'creates a new comment' do
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      comment = Comment.create(text: 'This is a test comment', bookmark_id: bookmark.id)

      persisted_data = persisted_data(table: 'comments', id: comment.id )

      expect(comment).to be_a Comment
      expect(comment.id).to eq persisted_data.first['id']
      expect(comment.text).to eq 'This is a test comment'
      expect(comment.bookmark_id).to eq bookmark.id
    end
  end

  describe '#where' do
    it 'gets the relevant comments from the db' do
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Comment.create(text: 'test comment', bookmark_id: bookmark.id)
      Comment.create(text: 'another test comment', bookmark_id: bookmark.id)

      comments = Comment.where(bookmark_id: bookmark.id)
      first_comment = comments.first
      persisted_data = persisted_data(table: 'comments', id: first_comment.id)

      expect(comments.length).to eq 2
      expect(first_comment.id).to eq persisted_data.first['id']
      expect(first_comment.text).to eq 'test comment'
      expect(first_comment.bookmark_id).to eq bookmark.id
    end
  end
end
