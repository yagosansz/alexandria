require "rails_helper"

RSpec.describe Book, type: :model do
  context "for associations" do
    it { is_expected.to belong_to(:publisher).optional }
    it { is_expected.to belong_to(:author) }
  end

  context "for validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:isbn_10) }
    it { is_expected.to validate_presence_of(:isbn_13) }
    it { is_expected.to validate_presence_of(:released_on) }
    it { is_expected.to validate_presence_of(:author) }

    it { is_expected.to validate_length_of(:isbn_10).is_equal_to(10) }
    it { is_expected.to validate_length_of(:isbn_13).is_equal_to(13) }

    it { is_expected.to validate_uniqueness_of(:isbn_10) }
    it { is_expected.to validate_uniqueness_of(:isbn_13) }
  end

  it "has a valid model" do
    book = build(:book)
    expect(book.valid?).to be true
  end
end
