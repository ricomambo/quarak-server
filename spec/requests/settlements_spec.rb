require 'spec_helper'

describe 'Settlements', type: :request do

  describe "Authorization" do
    describe "Retrieving settlements" do
      it "returns 401 if wrong credentials are passed" do
        get "api/projects/1/settlements"
        expect( response.code ).to eql '401'
      end
    end

    describe "Creating a settlement" do
      it "returns 401 if wrong credentials are passed" do
        post "api/projects/1/settlements", settlement: {}
        expect( response.code ).to eql '401'
      end
    end
  end

  describe "Retrieve settlements" do
    let!(:user)    { create(:user) }
    let!(:project) { create(:project) }
    let(:headers)  { user_auth_header(user) }

    before {
      @settlements = create_list(:settlement, 3, project: project).reverse
    }

    it "gets the list of settlements" do
      get "api/projects/#{project.id}/settlements", nil, headers
      expect( response ).to be_success
      expect( json['settlements'].size ).to eql 3

      settlement = json['settlements'].first
      expect( settlement['id'] ).to             eql @settlements.first.id
      expect( settlement['amount'] ).to         eql @settlements.first.amount.to_s
      expect( settlement['payer']['id'] ).to    eql @settlements.first.payer.id
      expect( settlement['payer']['email'] ).to eql @settlements.first.payer.email
      expect( settlement['payer']['name']).to   eql @settlements.first.payer.name
      expect( settlement['payee']['id'] ).to    eql @settlements.first.payee.id
      expect( settlement['payee']['email'] ).to eql @settlements.first.payee.email
      expect( settlement['payee']['name'] ).to  eql @settlements.first.payee.name
    end
  end

  describe "Create settlement" do
    let!(:user)    { create(:user) }
    let!(:project) { create(:project) }
    let!(:payer)   { create(:user) }
    let!(:payee)   { create(:user) }
    let(:headers)  { user_auth_header(user) }

    context "given valid attributes" do
      let(:params) do
        {
          settlement: {
            payer_id: payer.id,
            payee_id: payee.id,
            amount: 13.25
          }
        }
      end

      it "returns 200 ok" do
        post "api/projects/#{project.id}/settlements", params, headers
        expect( response.code ).to eql '200'
      end

      it "returns the new settlement json" do
        post "api/projects/#{project.id}/settlements", params, headers

        json_settl = json['settlement']
        settlement = Settlement.last

        expect( json_settl['id'] ).to             eql settlement.id
        expect( json_settl['amount'] ).to         eql settlement.amount.to_s
        expect( json_settl['payer']['id'] ).to    eql settlement.payer.id
        expect( json_settl['payer']['email'] ).to eql settlement.payer.email
        expect( json_settl['payer']['name']).to   eql settlement.payer.name
        expect( json_settl['payee']['id'] ).to    eql settlement.payee.id
        expect( json_settl['payee']['email'] ).to eql settlement.payee.email
        expect( json_settl['payee']['name'] ).to  eql settlement.payee.name
      end

    end


    context "given invalid attributes" do
      let(:params) do
        {
          settlement: {
            payer_id: payer.id,
          }
        }
      end

      it "returns 422 Unprocessable entity" do
        post "api/projects/#{project.id}/settlements", params, headers
        expect( response.code ).to eql '422'
      end
    end
  end

  describe "Delete settlement" do
      let!(:user)       { create(:user) }
      let!(:project)    { create(:project, members: [user]) }
      let!(:settlement) { create(:settlement, project: project) }
      let(:headers)     { user_auth_header(user) }

    it "responds with 204" do
      delete "api/projects/#{project.id}/settlements/#{settlement.id}", {}, headers
      expect( response.code ).to eql "204"
    end

    it "deletes the settlement" do
      delete "api/projects/#{project.id}/settlements/#{settlement.id}", {}, headers
      expect { settlement.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
