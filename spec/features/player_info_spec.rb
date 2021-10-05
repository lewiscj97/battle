feature 'Player Info' do
  
  scenario 'Players enter their names, names are displayed' do
    sign_in_and_play

    expect(page).to have_content 'foo vs bar'
  end

  scenario 'Player2 hit points are displayed' do
    sign_in_and_play

    expect(page).to have_content 'bar HP: 100'
  end

  scenario 'Player1 is notified when they successfully attack player 2' do
    sign_in_and_play

    click_button 'Attack'

    expect(page).to have_content 'foo attacked bar!'
  end
end