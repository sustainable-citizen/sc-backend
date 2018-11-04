require 'rails_helper'

RSpec.describe 'Samples API', type: :request do
  # initialize test data
  let!(:samples) {create_list(:sample, 10)}
  let(:sample_id) {samples.first.id}


  # Test suite for GET /samples
  describe 'GET /samples' do

    #get token first
    let(:token) {double acceptable?: true}
    before do
      allow_any_instance_of(ApplicationController).to receive(:doorkeeper_token).and_return(token)
      get '/samples'
      # allow(controller).to receive(:doorkeeper_token) {token} # => RSpec 3
    end
    #end of get token.


    # make HTTP get request before each example
    #before { get '/samples' }

    it 'returns samples' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /samples/:id
  describe 'GET /samples/:id' do

    #get token first
    let(:token) {double acceptable?: true}
    before do
      allow_any_instance_of(ApplicationController).to receive(:doorkeeper_token).and_return(token)
      get "/samples/#{sample_id}"
      # allow(controller).to receive(:doorkeeper_token) {token} # => RSpec 3
    end
    #end of get token


    context 'when the record exists' do
      it 'returns the sample' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(sample_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:sample_id) {100}

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Sample/)
      end
    end
  end

  # Test suite for POST /samples
  describe 'POST /samples' do
    # valid payload
    let(:valid_attributes) {{title: 'Testing'}}

    context 'when the request is valid' do
      #get token first
      let(:token) {double acceptable?: true}
      before do
        allow_any_instance_of(ApplicationController).to receive(:doorkeeper_token).and_return(token)
        post '/samples', params: valid_attributes
        # allow(controller).to receive(:doorkeeper_token) {token} # => RSpec 3
      end
      #end of get token


      #before { post '/samples', params: valid_attributes }

      it 'creates a sample' do
        expect(json['title']).to eq('Testing')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      #get token first
      let(:token) {double acceptable?: true}
      before do
        allow_any_instance_of(ApplicationController).to receive(:doorkeeper_token).and_return(token)
        post '/samples', params: {}
        # allow(controller).to receive(:doorkeeper_token) {token} # => RSpec 3
      end
      #end of get token

      #before { post '/samples', params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
            .to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  # Test suite for PUT /samples/:id
  describe 'PUT /samples/:id' do
    let(:valid_attributes) {{title: 'Shopping'}}

    context 'when the record exists' do

      #get token first
      let(:token) {double acceptable?: true}
      before do
        allow_any_instance_of(ApplicationController).to receive(:doorkeeper_token).and_return(token)
        put "/samples/#{sample_id}", params: valid_attributes
        # allow(controller).to receive(:doorkeeper_token) {token} # => RSpec 3
      end
      #end of get token


      #before {put "/samples/#{sample_id}", params: valid_attributes}

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /samples/:id
  describe 'DELETE /samples/:id' do

    #get token first
    let(:token) {double acceptable?: true}
    before do
      allow_any_instance_of(ApplicationController).to receive(:doorkeeper_token).and_return(token)
      delete "/samples/#{sample_id}"
      # allow(controller).to receive(:doorkeeper_token) {token} # => RSpec 3
    end
    #end of get token


    #before {delete "/samples/#{sample_id}"}

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end