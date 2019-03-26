require 'rails_helper'

feature 'creating a chirp', type: :feature do

  before :each do
    create(:user)
  end
  
  scenario 'takes a body' do 
    log_in_user(User.last)
    visit new_chirp_url
    expect(page).to have_content 'New Chirp'
    expect(page).to have_content 'Body:'
  end

  scenario 'takes us back to chirps #show' do
    log_in_user(User.last)
    make_chirp("it's snowing!!!")
    expect(page).to have_content("it's snowing!!!")
  end
end

feature 'deleting a chirp', type: :feature do

  before :each do
    create(:user)
    log_in_user(User.last)
    make_chirp("to be deleted...")
    click_button("Destroy this Chirp")
  end
  
  scenario 'destroys the chirp' do
    save_and_open_page 
    # opens the page and show you what the page looks like right now in the code.
    expect(page).to_not have_content("to be deleted...")
    expect(page).to have_content("All the chirps!!!")
  end

end

