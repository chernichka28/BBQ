require "rails_helper"

RSpec.describe EventPolicy do
  let(:user_owner) { create(:user) }
  let(:event) { create(:event, user: user_owner) }
  let(:user_usual) { create(:user) }

  # объект тестирования (политика)
  subject { EventPolicy }

  context "only owner can edit update destroy" do
    permissions :edit? do
      it { is_expected.to permit(user_owner, event) }
      it { is_expected.not_to permit(user_usual, event) }
      it { is_expected.not_to permit(nil, event) }
    end
  end

  context "everyone can see" do
    permissions :show? do
      it { is_expected.to permit(user_owner, event) }
      it { is_expected.to permit(user_usual, event) }
      it { is_expected.to permit(nil, event) }
    end
  end
end
