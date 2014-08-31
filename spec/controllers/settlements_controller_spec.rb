require 'spec_helper'

describe Api::V1::SettlementsController do

  let!(:user) { create(:user) }
  before { set_auth_token(user.token) }
  let(:default_params) { { format: :json } }

  describe "POST create" do
    let!(:project) { create(:project) }
    let!(:payer)   { create(:user) }
    let!(:payee)   { create(:user) }
    let(:params) do
      default_params.merge({
        project_id: project.id,
        settlement: settlement_params
      })
    end

    context "given valid attributes" do
      let(:settlement_params) do
        {
          payer_id: payer.id,
          payee_id: payee.id,
          amount: 13.25
        }
      end

      it "creates a new settlement" do
        expect {
          post 'create', params
        }.to change { project.settlements.reload.count }.by(1)
      end
    end

    context "given invalid attributes" do
      let(:settlement_params) do
        { payer_id: '123' }
      end

      it "doesn't create a new settlement" do
        expect {
          post 'create', params
        }.not_to change { project.settlements.reload.count }
      end
    end
  end
end
