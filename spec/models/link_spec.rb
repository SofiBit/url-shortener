require 'spec_helper'
require 'rails_helper'

describe Link, type: :model do
  subject { create(:link) }

  describe 'validations' do
    it 'should validate uniqueness' do
      expect(subject).to validate_uniqueness_of(:short_url)
    end

    it 'should mark errors' do
      link = Link.create(source_link: 'test', short_url: 'hhh')
      expect(link.errors[:source_link]).to be_present
    end
  end
end
