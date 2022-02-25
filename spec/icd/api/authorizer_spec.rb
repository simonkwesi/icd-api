# frozen_string_literal: true

require "icd/api/authorizer"

RSpec.describe Icd::Api::Authorizer do
  let(:token) { "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE2NDU1NDEzNDAsImV4cCI6MTY0NTU0NDk0MCwiaXNzIjoiaHR0cHM6Ly9pY2RhY2Nlc3NtYW5hZ2VtZW50Lndoby5pbnQiLCJhdWQiOlsiaHR0cHM6Ly9pY2RhY2Nlc3NtYW5hZ2VtZW50Lndoby5pbnQvcmVzb3VyY2VzIiwiaWNkYXBpIl0sImNsaWVudF9pZCI6IjY3MDYwNjg1LTE0ZDAtNDQxMS1iNjA3LTI2YmM4NmRkOWY0N185ODNiMDU0YS1kOTg0LTQ2NmEtOGE4OC1iOTE1MWUyZDVmZjAiLCJzY29wZSI6WyJpY2RhcGlfYWNjZXNzIl19.MXGNVUIcgd6CD55Qh6naBD38DuqFmB1ib4RBts0nL4nH7fGEq-JqM5DYdx-IcfQ9SMjVCSviL3YKy-1s9kklHE75xof5-YdVdfyR6X9E-oUZEXsSM8dSTrwxcjkXOg7HnNeiqEZxMHdlA1-f0i0OLJ_Q7W8VE29rdHm3Qoh9-kCVJbePzLkaXIsnVOXqNSPsAMQ2vDLV2viKzgGNHiKljIFR8BoOOftAAbs97apNW99Ke4bawiu4zAw6VxBH02_ElvxRvVzOxnVnH0xHuEmf6S2BcR_WVCGcKwLl80YpV3utN7ukL6YRm_5Gcl_bx208zbfbAzCk0NDZtEpZlRgToQ" }
  let(:faraday) { double(Faraday) }
  before :each do
    allow(subject).to receive(:http_adapter).and_return(faraday)
    allow(faraday).to_receive(:post).and_return("{}")
  end
  describe "#retrieve_access_token" do
    subject { described_class.new(client_id: "client_id", client_secret: "client_secret") }

    it "send request to token endpoint" do
      subject.retrieve_access_token
      expect(faraday).to have_received(:post).with("https://icdaccessmanagement.who.int/connect/token", scope: "icdapi_access", grant_type: "client_credentials", client_id: "client_id", client_secret: "client_secret")
    end
  end
end
