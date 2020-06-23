# frozen_string_literal: true

FactoryBot.define do
  factory :dataset do
    title { ['Testing'] }
    factory :populated_dataset do
      title { ["The 1929 Stock Market: Irving Fisher Was Right: Additional Files"] }
      creator { ["McGrattan, Ellen R.", "Prescott, Edward C."] }
      series { ["Staff Report (Federal Reserve Bank of Minneapolis. Research Department)"] }
      resource_type { ["Dataset"] }
      visibility { "open" }
      abstract { ["This is my abstract"] }
      description { ["This is my description"] }
      identifier { ["https://doi.org/10.21034/sr.600"] }
      issue_number { ["Vol. 33, No. 1"] }
    end
  end
end
