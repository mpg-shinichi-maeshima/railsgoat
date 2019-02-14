# frozen_string_literal: true
require "spec_helper"

feature "unvalidated redirect" do
  let(:normal_user) { UserFixture.normal_user }

  before do
    UserFixture.reset_all_users

    pending unless verifying_fixed?
  end

  scenario "attack\nTutorial: https://github.medpeer.co.jp/akira-sannoh/railsgoat/wiki/R5-A10-Unvalidated-Redirects-and-Forwards-(redirect_to)", js: true do
    visit "/?url=http://example.com/do/evil/things"
    within(".signup") do
      fill_in "email", with: normal_user.email
      fill_in "password", with: normal_user.clear_password
    end
    within(".actions") do
      click_on "Login"
    end

    expect(current_url).to eq("/dashboard/home")
  end
end
