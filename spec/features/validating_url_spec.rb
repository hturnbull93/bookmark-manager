feature 'Validating URL input' do
  scenario 'new bookmark url: hello-world raises flash notice' do
    visit '/bookmarks/new'
    fill_in('url', with: 'hello-world')
    fill_in('title', with: 'Any old title')
    click_button 'Submit'

    expect(page).to_not have_content 'hello-world'
    expect(page).to have_content 'You must submit a valid URL'
  end

  scenario 'editing a bookmark url: hello-world raises flash notice' do
    bookmark = Bookmark.create(url: 'https://www.mispelleddomain.com', title: 'Mispelled Title')

    visit 'bookmarks'
    expect(page).to have_link('Mispelled Title', href: 'https://www.mispelleddomain.com')
    first('.bookmark').click_button 'Edit'

    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"
    fill_in('title', with: 'YouTube')
    fill_in('url', with: 'not valid url')
    click_button 'Submit'

    expect(current_path).to eq '/bookmarks'
    expect(page).to_not have_link('YouTube', href: 'not valid url')
    expect(page).to have_content 'You must submit a valid URL'
  end
end
