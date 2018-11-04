require 'rails_helper'

RSpec.describe "OauthTests", type: :request do
  describe "POST /oauth/token" do
    let(:valid_param) {{grant_type: 'password', username: 'c@a.com', password: '123456'}}
    let(:create_user) {{api_v1_user: {email: 'c@a.com', first_name: 'fname', last_name: 'lname', password: '123456'}}}
    context 'when the post is valid' do
      before {post '/api/v1/users', params: create_user}
      before {post '/oauth/token', params: valid_param}
      it 'create and get token successfully' do
        expect(json['token_type']).to eq('Bearer')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end


    context 'when the post is invalid' do
      before {post '/oauth/token'}
      it 'invalid request' do
        expect(json['error']).to eq('invalid_request')
      end

      it 'return status code 401' do
        expect(response).to have_http_status(401)
      end

    end
  end
end
