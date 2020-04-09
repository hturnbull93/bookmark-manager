feature 'Adding bookmarks' do
  scenario 'user adds https://github.com' do
    visit 'bookmarks/new'
    fill_in('url', with: 'https://github.com')
    click_button('Submit')

    expect(page).to have_content 'https://github.com'
  end

  scenario 'user adds https://www.youtube.com' do
    visit 'bookmarks/new'
    fill_in('url', with: 'https://www.youtube.com')
    click_button('Submit')

    expect(page).to have_content 'https://www.youtube.com'
  end
end
