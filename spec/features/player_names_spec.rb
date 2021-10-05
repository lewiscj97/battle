feature 'Player Names' do
  
  scenario 'Players enter their names, namess are displayed' do
    visit '/'
    expect(page).to have_content 'Testing infrastructure working!'
  end
end