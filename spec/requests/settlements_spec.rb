require 'spec_helper'

describe 'Settlements', type: :request do

  describe "Authorization" do
    describe "Retrieving settlements" do
      it "returns 401 if wrong credentials are passed" do
        get "api/projects/1/settlements"
        expect( response.code ).to eql '401'
      end
    end
  end

  describe "Retrieve settlements" do
    let!(:user)    { create(:user) }
    let!(:project) { create(:project) }
    let(:headers)   { user_auth_header(user) }

    before {
      @settlements = create_list(:settlement, 3, project: project).reverse
    }

    it "gets the list of settlements" do
      get "api/projects/#{project.id}/settlements", nil, headers
      expect( response ).to be_success
      expect( json[:settlements].size ).to eql 3

      settlement = json[:settlements].first
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
end
