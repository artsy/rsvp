require 'rails_helper'

describe 'Constellation module' do
  
  context 'requests' do
    before do
      allow(RsvpRails).to receive(:config).and_return(jwt_token: 'token', constellation_url: 'https://example.com')
    end
    let(:rsvp_params) { { name: 'Matt', email: 'matt@email.com' } }
    let(:successful_stub) { stub_request(:post, 'https://example.com/rsvps').to_return(body: '{}', status: 201) }
    let(:unsuccessful_stub) { stub_request(:post, 'https://example.com/rsvps').to_return(body: 'uh oh', status: 400) }
    it 'makes the right POST request with headers and body' do
      successful_stub
      Constellation.create_rsvp!(rsvp_params)
      expect(successful_stub).to have_been_requested
    end
    it 'raises an exception on an unsuccessful rsvp create' do
      unsuccessful_stub
      expect do
        Constellation.create_rsvp!(rsvp_params)
      end.to raise_error(ConstellationHttpException) do |e|
        expect(e.message).to eq 'uh oh'
      end
    end
    it 'raises an exception on a more generic http error' do
      allow(Net::HTTP).to receive(:new).and_raise(SocketError.new('uh oh'))
      expect do
        Constellation.create_rsvp!(rsvp_params)
      end.to raise_error(ConstellationHttpException) do |e|
        expect(e.message).to eq 'uh oh'
      end
    end
  end
end
