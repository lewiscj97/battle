feature 'Player Names' do
  
  scenario 'Players enter their names, names are displayed' do
    visit '/'

    fill_in 'player1', with: 'foo'
    fill_in 'player2', with: 'bar'

    click_button 'Submit'

    expect(page).to have_content 'foo vs bar'
  end
end