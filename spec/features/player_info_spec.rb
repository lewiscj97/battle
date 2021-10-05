feature 'Player Info' do
  
  scenario 'Players enter their names, names are displayed' do
    visit '/'

    fill_in 'player1', with: 'foo'
    fill_in 'player2', with: 'bar'

    click_button 'Submit'

    expect(page).to have_content 'foo vs bar'
  end

  scenario 'Player2 hit points are displayed' do
    visit '/'
    fill_in 'player1', with: 'foo'
    fill_in 'player2', with: 'bar'

    click_button 'Submit'

    expect(page).to have_content 'foo vs bar'
    expect(page).to have_content 'bar HP: 100'
  end
end