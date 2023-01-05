# frozen_string_literal: true

RSpec.describe GcisService do
  it 'success' do
    VCR.use_cassette 'gcis_successfully_message' do
      response = GcisService.new('83598406').call
      expect(response['Business_Accounting_NO']).to eq('83598406')
    end
  end

  it 'failed' do
    VCR.use_cassette 'gcis_failed_message' do
      response = GcisService.new('').call
      expect(response).to eq('')
    end
  end
end
