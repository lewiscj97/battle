feature 'Homepage' do
  
  scenario 'Testing infrastructure working' do
    visit '/'
    expect(page).to have_content 'Testing infrastructure working!'
  end
end