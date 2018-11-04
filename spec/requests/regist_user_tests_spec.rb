require 'rails_helper'

RSpec.describe "RegistUserTests", type: :request do
  describe "POST /api/v1/users" do
    let(:valid_attributes) {{api_v1_user:{email: 'c@a.com', first_name: 'fname', last_name: 'lname', password: '123456'}}}
    let(:invalid_attribute) {}
    context 'when the post valid' do
      before {post '/api/v1/users', params: valid_attributes}
      it 'creates a user' do
        expect(json['email']).to eq('c@a.com')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the post is not valid' do
      before {post '/api/v1/users', params: invalid_attribute}
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
            .to match("{\"errors\":{\"email\":[\"can't be blank\"],\"password\":[\"can't be blank\"]}}")
      end
    end


  end
end
