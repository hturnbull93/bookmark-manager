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

  scenario 'user adds https://www.youtube.com, and sees all current bookmarks' do
    # Add the test data
    Bookmark.create(url: 'http://www.makersacademy.com')
    Bookmark.create(url: 'http://www.destroyallsoftware.com')
    Bookmark.create(url: 'http://www.google.com')

    visit 'bookmarks/new'
    fill_in('url', with: 'https://www.youtube.com')
    click_button('Submit')

    expect(page).to have_content 'https://www.youtube.com'
    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
    expect(page).to have_content 'http://www.google.com'
  end
end
