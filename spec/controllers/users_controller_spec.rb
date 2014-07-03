require 'spec_helper'

describe Api::V1::UsersController do

  let(:default_params) do { format: 'json' } end

  describe "POST create" do
    context "given valid params" do
      let(:params) do
        default_params.merge(
          user: {
            name: 'Rodri',
            email: 'rodri@gmail.com',
            password: '123456'
          }
        )
      end

      it "responds 200 OK" do
        post 'create', params
        expect( response.code ).to eql '200'
      end

      it "creates a new user" do
        expect {
          post 'create', params
        }.to change { User.count }.by(1)
      end

      it "responds with the created user json" do
        post 'create', params

        json = ActiveSupport::JSON.decode(response.body)

        expect( json['id'] ).to       be_a(Fixnum)
        expect( json['name'] ).to     eql 'Rodri'
        expect( json['email'] ).to    eql 'rodri@gmail.com'
      end

    end

    context "given invalid params" do
      let(:params) do
        default_params.merge(
          user: {
            name: 'Rodri',
            email: '',
            password: '123'
          }
        )
      end

      it "responds with error" do
        post 'create', params
        response.should_not be_success
      end

      it "responds with the json error messages" do
        post 'create', params
        json = ActiveSupport::JSON.decode(response.body)

        json['email'].should include "can't be blank"
      end
    end
  end

  describe "GET index" do

    let!(:user) { create(:user) }

    before { set_auth_token(user.token) }

    it "works" do
      get 'index', default_params
      response.should be_success
    end

  end
end
