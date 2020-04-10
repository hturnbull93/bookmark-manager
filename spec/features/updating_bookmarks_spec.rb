feature 'Updating Bookmarks' do
  scenario 'replace mispelled title' do
    bookmark = Bookmark.create(url: 'https://www.mispelleddomain.com', title: 'Mispelled Title')

    visit 'bookmarks'
    expect(page).to have_link('Mispelled Title', href: 'https://www.mispelleddomain.com')
    first('.bookmark').click_button 'Edit'

    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"
    fill_in('title', with: 'YouTube')
    fill_in('url', with: 'https://www.youtube.com')
    click_button 'Submit'

    expect(current_path).to eq '/bookmarks'
    expect(page).to_not have_link('Mispelled Title', href: 'https://www.mispelleddomain.com')
    expect(page).to have_link('YouTube', href: 'https://www.youtube.com')
  end
end
