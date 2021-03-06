# frozen_string_literal: true

# Generated via
#  `rails generate hyrax:work Publication`
require 'rails_helper'

include Warden::Test::Helpers

RSpec.describe 'Create a Publication', type: :system, js: true do
  context 'a logged in admin user' do
    let(:user) { FactoryBot.create(:admin) }
    before do
      login_as user
      AdminSet.find_or_create_default_admin_set_id
    end

    scenario 'fill in and submit the form' do
      visit '/concern/publications/new'
      expect(page).to have_content "Add New Publication"

      # Only the 'title' field should be required
      expect(page).to have_css('li#required-metadata.incomplete')
      fill_in 'Title', with: 'Title'
      click_on 'Title'
      expect(page).to have_css('li#required-metadata.complete')

      find('#publication_series').click
      fill_in 'Series', with: 'Staff Reports (Federal Reserve Bank of Minneapolis. Research Division.)'
      fill_in 'Issue number', with: '111'
      fill_in 'Date Created', with: '2019-05-01'
      fill_in 'Keyword', with: 'Keyword'
      fill_in 'Subject (JEL)', with: 'A10 - General Economics: General'
      fill_in 'Abstract', with: 'Abstract'
      fill_in 'Description', with: 'Description'
      fill_in 'DOI', with: 'DOI'
      fill_in 'Related URL', with: '<http://curationexperts.com>'
      fill_in 'Corporate Author', with: 'Federal Reserve Bank of Minneapolis. Research Division.'
      fill_in 'Publisher', with: 'Federal Reserve Bank of Minneapolis. Research Division.'
      select 'Article', from: 'Resource type'

      click_on 'Additional fields'

      fill_in 'Contributor', with: 'Contributor'
      select 'In Copyright', from: 'Rights statement'
      fill_in 'Language', with: 'Language'
      fill_in 'Source', with: 'Source'
      fill_in 'Alternative Title', with: 'Alternative Title'
      fill_in 'Bibliographic Citation', with: 'Bibliographic Citation'
      fill_in 'Date Available', with: 'Date Available'
      fill_in 'Extent', with: 'Extent'
      fill_in 'Relation: Has Part', with: 'Relation: Has Part'
      fill_in 'Relation: Is Version Of', with: 'Relation: Is Version Of'
      fill_in 'Relation: Has Version', with: 'Relation: Has Version'
      fill_in 'Relation: Is Replaced By', with: 'Relation: Is Replaced By'
      fill_in 'Relation: Requires', with: 'Relation: Requires'
      fill_in 'Spatial', with: 'Spatial'
      fill_in 'Temporal', with: 'Temporal'
      fill_in 'Table of Contents', with: 'Table of Contents'

      find('body').click
      click_link 'Files'

      execute_script("$('.fileinput-button input:first').css({'opacity':'1', 'display':'block', 'position':'relative'})")
      attach_file('files[]', File.absolute_path(file_fixture('pdf-sample.pdf')))
      sleep(1)
      # With selenium and the chrome driver, focus remains on the
      # select box. Click outside the box so the next line can't find
      # its element

      find('body').click
      choose('publication_visibility_open')
      expect(page).to have_content('Please note, making something visible to the world (i.e. marking this as Public) may be viewed as publishing which could impact your ability to')
      # These lines are for debugging, should this test fail
      # puts "Required metadata: #{page.evaluate_script(%{$('#form-progress').data('save_work_control').requiredFields.areComplete})}"
      # puts "Required files: #{page.evaluate_script(%{$('#form-progress').data('save_work_control').uploads.hasFiles})}"
      # puts "Agreement : #{page.evaluate_script(%{$('#form-progress').data('save_work_control').depositAgreement.isAccepted})}"

      # TO DO: Capybara not kicking off method to submit
      # so no work show page appears. Save the form
      # find('#with_files_submit').click

      # Now we are on the show page for the new record
      # expect(page).to have_selector 'h1', text: 'Title'
      # expect(page).to have_content('Staff Reports (Federal Reserve Bank of Minneapolis. Research Division.)')
      # expect(page).to have_content('111')
      # expect(page).to have_content('2019-05-01')
      # expect(page).to have_content('Description')
      # expect(page).to have_content('Abstract')
      # expect(page).to have_content('A10 - General Economics: General')
      # expect(page).to have_content('Keyword')
      # expect(page).to have_content('Table of Contents')
      # expect(page).to have_link('http://curationexperts.com')
      # expect(page).to have_content('Alternative Title')
      # expect(page).to have_content('Date Available')
      # expect(page).to have_content('Contributor')
      # expect(page).to have_content('Language')
      # expect(page).to have_content('Federal Reserve Bank of Minneapolis. Research Division.')
      # expect(page).to have_content('Federal Reserve Bank of Minneapolis. Research Division.')
      # expect(page).to have_content('Article')
      # expect(page).to have_content('Source')
      # expect(page).to have_content('Temporal')
      # expect(page).to have_content('Extent')
      # expect(page).to have_content('Bibliographic Citation')
      # expect(page).to have_content('DOI')
      # expect(page).not_to have_content('Relation: Has Part')
      # expect(page).not_to have_content('Relation: Is Version Of')
      # expect(page).not_to have_content('Relation: Has Version')
      # expect(page).not_to have_content('Relation: Is Replaced By')
      # expect(page).not_to have_content('Relation: Requires')
      # expect(page).to have_content('Spatial')
      # expect(page).to have_content('Title')
    end
  end
end
