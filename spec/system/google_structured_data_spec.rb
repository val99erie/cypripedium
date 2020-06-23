# frozen_string_literal: true
require 'rails_helper'
include Warden::Test::Helpers

RSpec.describe 'Use structured data that Google can parse', type: :system, clean: true do
  let(:work) { FactoryBot.create(:populated_dataset) }

  context "expected Google data is exposed"
  it "marks creators with schema.org tags" do
    visit "/concern/publications/#{work.id}"
    creators = page.all(:css, "[itemprop='creator']")
    expect(creators.first.text).to eq "McGrattan, Ellen R."
    expect(creators.last.text).to eq "Prescott, Edward C."
  end

  it "marks abstract with schema.org tags" do
    visit "/concern/publications/#{work.id}"
    expect(page.find(:css, '[itemprop="abstract"]').text).to eq "This is my abstract"
  end
  it "marks description with schema.org tags" do
    visit "/concern/publications/#{work.id}"
    descriptions = page.all(:css, "[itemprop='description']")
    expect(descriptions.first).not_to be_nil
    expect(descriptions.first.text).to eq "This is my description"
  end
  it "marks identifier with schema.org tags" do
    visit "/concern/publications/#{work.id}"
    identifiers = page.all(:css, "[itemprop='identifier']")
    expect(identifiers.first).not_to be_nil
    expect(identifiers.first.text.strip).to eq "https://doi.org/10.21034/sr.600"
  end
  xit "marks series with schema.org tags" do
    visit "/concern/publications/#{work.id}"
    series = page.all(:css, "[itemprop='series']")
    expect(series.first).not_to be_nil
    expect(series.first.text.strip).to eq "Staff Report (Federal Reserve Bank of Minneapolis. Research Department)"
  end
  it "marks issue number with schema.org tags" do
    visit "/concern/publications/#{work.id}"
    expect(page.find(:css, "[itemprop='issueNumber']").text.strip).to eq "Vol. 33, No. 1"
  end
end
