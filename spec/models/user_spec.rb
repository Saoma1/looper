require 'rails_helper'

RSpec.describe User, type: :model do
  describe "after creation" do
    it "send a confirmation email" do
      user = FactoryBot.build(:user)

      expect { user.save }.to change(
        Devise.mailer.deliveries, :count
      ).by(1)
    end
  end
end
