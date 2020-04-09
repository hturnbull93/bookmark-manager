feature 'Deleting Bookmarks' do
  scenario ' can delete the first bookmark on the list' do
    Bookmark.create(url: 'http://www.tobedeleted.com', title: 'Delete this')
    visit 'bookmarks'
    expect(page).to have_link('Delete this', href: 'http://www.tobedeleted.com')

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Delete this', href: 'http://www.tobedeleted.com')
  end
end
