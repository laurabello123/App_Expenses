require 'rails_helper'

RSpec.describe "Log In", type: :feature do
  before do
  end

  scenario "The login page exists" do
    visit new_user_session_path
    end
  end
