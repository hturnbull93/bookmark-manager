feature 'Deleting Bookmarks' do
  scenario ' can delete the first bookmark on the list' do
    visit 'bookmarks'
    expect(page).to have_link('Makers Academy', href: 'https://makersacademy.com')

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makers Academy', href: 'https://makersacademy.com')
  end
end
