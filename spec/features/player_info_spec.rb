# frozen_string_literal: true




feature 'Player Info' do
  scenario 'Players enter their names, names are displayed' do
    sign_in_and_play

    expect(page).to have_content 'foo vs bar'
  end

  scenario 'Player1 hit points are displayed' do
    sign_in_and_play

    expect(page).to have_content 'foo HP: 100'
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

feature 'attacking' do
  before(:each) do
    allow_any_instance_of(Player).to receive(:rand).with(1..10) { 10 }
  end

  scenario 'Player 2 HP is updated after being attacked' do
    sign_in_and_play
    click_button 'Attack'
    click_button 'Next turn'
    expect(page).to have_content 'bar HP: 90'
  end

  scenario 'Player2 is able to attack player1 after being attacked' do
    sign_in_and_play
    click_button 'Attack'
    click_button 'Next turn'
    click_button 'Attack'
    expect(page).to have_content 'bar attacked foo!'
  end
end

feature 'winning' do
  before(:each) do
    allow_any_instance_of(Player).to receive(:rand).with(1..10) { 10 }
  end
  scenario 'The game ends when a player hits 0hp and displays result' do
    sign_in_and_play

    18.times do
      click_button 'Attack'
      click_button 'Next turn'
    end

    click_button 'Attack'

    expect(page).to have_content 'foo wins!'
  end
end
