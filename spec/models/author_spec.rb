require "rails_helper"

RSpec.describe Author, type: :model do
  context "for associations" do
    it { is_expected.to have_many(:books) }
  end

  context "for validations" do
    it { is_expected.to validate_presence_of(:given_name) }
    it { is_expected.to validate_presence_of(:family_name) }
  end

  it "has a valid factory" do
    author = build(:author)
    expect(author.valid?).to be true
  end
end
