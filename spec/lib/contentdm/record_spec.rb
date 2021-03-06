# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Contentdm::Record do
  let(:record) { described_class.new(first_record) }
  let(:doc) { File.open(file_fixture('ContentDM_XML_Full_Fields.xml')) { |f| Nokogiri::XML(f) } }
  let(:first_record) { doc.xpath("//record[1]") }

  context "when initialized with a Nokogiri document" do
    describe '#legacy_file_name' do
      it 'returns the legacy file name' do
        expect(record.legacy_file_name).to eq('19750900fedmwp22')
      end
    end
    describe '#title' do
      it 'returns a title with the author removed' do
        expect(record.title).to eq(['Classical macroeconomic model for the United States, a'])
      end
    end
    describe '#contributor' do
      it 'returns an array of contributors' do
        expect(record.contributor).to eq(['Federal Reserve Bank of Minneapolis. Research Dept.'])
      end
    end
    describe '#subject' do
      it 'returns an array of subject' do
        expect(record.subject).to eq(['Rational expectations (Economic theory)--United States.', 'Unemployment--United States--Statistical methods.'])
      end
    end

    describe '#description' do
      it 'returns an array of descriptions' do
        expect(record.description).to eq(['Natural unemployment rate ; Montarist model ; Postwar United States ; post-1945 ; Rational expectations theory', 'Description 2'])
      end
    end

    describe '#date_created' do
      it 'returns an array of created dates' do
        expect(record.date_created).to eq(['1975-09'])
      end
    end

    describe '#publisher' do
      it 'returns an array of publishers' do
        expect(record.publisher).to eq(['Minneapolis : Federal Reserve Bank of Minneapolis'])
      end
    end
    describe '#work_type' do
      it 'returns a work_type' do
        expect(record.work_type).to eq 'Publication'
      end
    end
    describe '#table of contents' do
      it 'returns a table of contents' do
        expect(record.table_of_contents).to eq(['Table of contents'])
      end
    end
    describe '#abstract' do
      it 'returns an abstract' do
        expect(record.abstract[0]).to match(/A statistical definition/)
      end
    end
    describe '#requires' do
      it 'returns a requires attribute' do
        expect(record.requires).to eq(['22', 'requires'])
      end
    end
    describe '#replaces' do
      it 'returns a repaces attribute' do
        expect(record.replaces).to eq(['replaces'])
      end
    end
    describe '#is_replaced_by' do
      it 'returns an is replaced by attribute' do
        expect(record.is_replaced_by).to eq(['19760400jpe8402'])
      end
    end
    describe '#alternative_title' do
      it 'returns an alternative title attribute' do
        expect(record.alternative_title).to eq(['alternative'])
      end
    end
    describe '#series' do
      it 'returns a series attribute' do
        expect(record.series).to eq(['Working paper (Federal Reserve Bank of Minneapolis. Research Dept.)'])
      end
    end
    describe '#identifier' do
      it 'returns an identifier' do
        expect(record.identifier).to eq(['https://doi.org/10.21034/sr.XXX'])
      end
    end
    describe '#issue_number' do
      it 'returns an issue number' do
        expect(record.issue_number).to eq(['111'])
      end
    end
    describe '#resource_type' do
      it 'returns a resource type' do
        expect(record.resource_type).to eq(['Research Paper'])
      end
    end
  end
end
