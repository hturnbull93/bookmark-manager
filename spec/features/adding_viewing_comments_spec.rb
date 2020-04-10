# frozen_string_literal: true

feature 'Adding and Viewing Comments' do
  feature 'add comment and see it' do
    scenario 'add comment on first bookmark: "cool link bro"' do
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

      visit '/bookmarks'
      first('.bookmark').click_button 'Add Comment'

      expect(current_path).to eq "/bookmarks/#{bookmark.id}/comments/new"

      fill_in 'comment', with: 'cool link bro'
      click_button 'Submit'

      expect(current_path).to eq '/bookmarks'
      expect(first('.bookmark')).to have_content 'cool link bro'
    end
  end
end
