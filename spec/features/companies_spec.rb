# frozen_string_literal: true

RSpec.describe 'Company create flow', type: :feature do
  scenario 'Success', js: true do
    VCR.use_cassette 'gcis_successfully_message' do
      visit root_path
      expect(page).to have_content '後台管理人員登入'
      click_on '註冊企業帳號'
      expect(page).to have_content '企業帳號註冊'
      fill_in 'Gui number', with: '83598406'
      fill_in 'Name', with: 'Jobs'
      fill_in 'Email', with: Faker::Internet.email
      fill_in 'Password', with: 'Password'
      fill_in 'Password confirmation', with: 'Password'
      click_on '註冊'
      expect(page).to have_content '後台管理人員登入'
    end
  end

  context 'Failed' do
    scenario 'without email', js: true do
      visit root_path
      expect(page).to have_content '後台管理人員登入'
      click_on '註冊企業帳號'
      expect(page).to have_content '企業帳號註冊'
      fill_in 'Gui number', with: '83598406'
      fill_in 'Name', with: 'Jobs'
      fill_in 'Password', with: 'Password'
      fill_in 'Password confirmation', with: 'Password'
      click_on '註冊'
      expect(page).to have_content '企業帳號註冊'
    end

    scenario 'without name', js: true do
      visit root_path
      expect(page).to have_content '後台管理人員登入'
      click_on '註冊企業帳號'
      expect(page).to have_content '企業帳號註冊'
      fill_in 'Gui number', with: '83598406'
      fill_in 'Email', with: Faker::Internet.email
      fill_in 'Password', with: 'Password'
      fill_in 'Password confirmation', with: 'Password'
      click_on '註冊'
      expect(page).to have_content '企業帳號註冊'
    end

    scenario 'without Password', js: true do
      visit root_path
      expect(page).to have_content '後台管理人員登入'
      click_on '註冊企業帳號'
      expect(page).to have_content '企業帳號註冊'
      fill_in 'Gui number', with: '83598406'
      fill_in 'Name', with: 'Jobs'
      fill_in 'Email', with: Faker::Internet.email
      fill_in 'Password confirmation', with: 'Password'
      click_on '註冊'
      expect(page).to have_content '企業帳號註冊'
    end

    scenario 'without Password confirmation', js: true do
      visit root_path
      expect(page).to have_content '後台管理人員登入'
      click_on '註冊企業帳號'
      expect(page).to have_content '企業帳號註冊'
      fill_in 'Gui number', with: '83598406'
      fill_in 'Name', with: 'Jobs'
      fill_in 'Email', with: Faker::Internet.email
      fill_in 'Password', with: 'Password'
      click_on '註冊'
      expect(page).to have_content '企業帳號註冊'
    end
  end
end
