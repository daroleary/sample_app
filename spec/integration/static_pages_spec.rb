feature "Navigating static pages site" do
  scenario "Go to root page" do
    page.visit "/"
    expect(page).to have_content("Welcome to the Sample App")

    click_link 'Home'
    expect(page).to have_content("Welcome to the Sample App")

    click_link 'Help'
    expect(page).to have_content("Help")

    click_link 'Log in'
    expect(page).to_not have_content("Login")

    click_link 'About'
    expect(page).to have_content("About")

    click_link 'Contact'
    expect(page).to have_content("Contact")

    # click_link 'News'
    # expect(page).to have_content("Ruby on Rails Tutorial News")
  end
end