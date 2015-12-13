feature "User signup" do
  scenario "Go to sign up page" do
    page.visit "/signup"

    expect(page).to have_content("Sign up")
  end

  scenario "Go to sign up page" do
    expect(User.count).to eql(0)

    page.visit "/signup"
    sign_up_with 'Test User', 'valid@example.com', 'foobar', 'foobar'

    expect(page).to have_content("Test User")
    expect(User.count).to eql(1)
  end

  def sign_up_with(name, email, password, password_confirmation)
    page.visit "/signup"
    page.fill_in 'Name', with: name
    page.fill_in 'Email', with: email
    page.fill_in 'Password', with: password
    page.fill_in 'Confirmation', with: password_confirmation

    click_button 'Create my account'
  end
end