# frozen_string_literal: true

RSpec.describe Icd::Api::AccessToken do
  subject do
    described_class.new({ 'expires_in' => 4000, 'access_token' => token })
  end

  let(:token) do
    'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9' \
      '.eyJuYmYiOjE2NDU1NDEzNDAsImV4cCI6MTY' \
      '0NTU0NDk0MCwiaXNzIjoiaHR0cHM6Ly9pY2R' \
      'hY2Nlc3NtYW5hZ2VtZW50Lndoby5pbnQiLCJ' \
      'hdWQiOlsiaHR0cHM6Ly9pY2RhY2Nlc3NtYW5' \
      'hZ2VtZW50Lndoby5pbnQvcmVzb3VyY2VzIiw' \
      'iaWNkYXBpIl0sImNsaWVudF9pZCI6IjY3MDY' \
      'wNjg1LTE0ZDAtNDQxMS1iNjA3LTI2YmM4NmR' \
      'kOWY0N185ODNiMDU0YS1kOTg0LTQ2NmEtOGE' \
      '4OC1iOTE1MWUyZDVmZjAiLCJzY29wZSI6WyJ' \
      'pY2RhcGlfYWNjZXNzIl19.MXGNVUIcgd6CD5' \
      '5Qh6naBD38DuqFmB1ib4RBts0nL4nH7fGEq-' \
      'JqM5DYdx-IcfQ9SMjVCSviL3YKy-1s9kklHE' \
      '75xof5-YdVdfyR6X9E-oUZEXsSM8dSTrwxcj' \
      'kXOg7HnNeiqEZxMHdlA1-f0i0OLJ_Q7W8VE2' \
      '9rdHm3Qoh9-kCVJbePzLkaXIsnVOXqNSPsAM' \
      'Q2vDLV2viKzgGNHiKljIFR8BoOOftAAbs97a' \
      'pNW99Ke4bawiu4zAw6VxBH02_ElvxRvVzOxn' \
      'VnH0xHuEmf6S2BcR_WVCGcKwLl80YpV3utN7' \
      'ukL6YRm_5Gcl_bx208zbfbAzCk0NDZtEpZlRgToQ'
  end
  let(:time_now) { Time.now.utc }

  before do
    allow(Time).to receive_message_chain(:now, :utc).and_return(time_now)
  end

  describe '#token' do
    it 'equals `access_token` hash key value' do
      expect(subject.token).to eq token
    end
  end

  describe '#expires_at' do
    it 'is calculated based on `expires_in` hash key value' do
      expect(subject.expires_at).to eq time_now + 4000
    end
  end
end
