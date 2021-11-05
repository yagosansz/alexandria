require "rails_helper"

RSpec.describe Publisher, type: :model do
  context "for associations" do
    it { is_expected.to have_many(:books) }
  end

  context "for validations" do
    it { is_expected.to validate_presence_of(:name) }
  end

  it "has a valid factory" do
    expect(build(:publisher)).to be_valid
  end
end
