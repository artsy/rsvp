require 'rails_helper'

describe 'Constellation module' do
  
  context 'requests' do
    let(:rsvp_params) { { name: 'Matt', email: 'matt@email.com', event_id: "420" }.with_indifferent_access }
    it 'makes the right POST request with headers and body, and returns the total count' do
      VCR.use_cassette('successful Constellation creation') do
        _, count = Constellation.create_rsvp!(rsvp_params)
        expect(count).to eq 1
      end
    end
    it 'raises an exception on an unsuccessful rsvp create' do
      rsvp_params.delete(:event_id)
      VCR.use_cassette('unsuccessful Constellation creation') do
        expect do
          Constellation.create_rsvp!(rsvp_params)
        end.to raise_error(Constellation::GraphQLException) do |e|
          expect(e.message).to eq 'Validation failed: Event can\'t be blank'
        end
      end
    end
    it 'raises an exception on a more generic http error' do
      allow(Net::HTTP).to receive(:new).and_raise(SocketError.new('uh oh'))
      expect do
        Constellation.create_rsvp!(rsvp_params)
      end.to raise_error(Constellation::HttpException) do |e|
        expect(e.message).to eq 'uh oh'
      end
    end
  end
end
