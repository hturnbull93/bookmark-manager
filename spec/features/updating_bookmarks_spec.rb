feature 'Updating Bookmarks' do
  scenario 'replace mispelled title' do
    Bookmark.create(url: 'https://www.youtube.com', title: 'Mispelled Title')

    visit 'bookmarks'
    expect(page).to have_link('Mispelled Title', href: 'https://www.youtube.com')
    first('.bookmark').click_button 'Update'

    fill_in('title', with: 'YouTube')
    click_button 'Submit'

    expect(current_path).to eq '/bookmarks'
    expect(page).to_not have_link('Mispelled Title', href: 'https://www.youtube.com')
    expect(page).to have_link('YouTube', href: 'https://www.youtube.com')
  end
end
