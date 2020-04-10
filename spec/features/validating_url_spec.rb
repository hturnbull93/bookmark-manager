feature 'Validating URL input' do
  scenario 'url: hello-world raises flash notice' do
    visit '/bookmarks/new'
    fill_in('url', with: 'hello-world')
    fill_in('title', with: 'Any old title')
    click_button 'Submit'

    expect(page).to_not have_content 'hello-world'
    expect(page).to have_content 'You must submit a valid URL'
  end
end
