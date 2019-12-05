require 'spec_helper'
require 'rails_helper'

describe Links do
  include Links

  let(:source_link) { 'https://upyachka.ru/' }

  describe 'encode' do
    it 'should return unique symbols for short url' do
      link = Link.find_by(short_url: encode(source_link))

      expect(link).to be nil
    end
  end

  describe 'link_new?' do
    it 'should return false' do
      expect(link_new?(source_link)).to be true
    end
  end

  describe 'link_exist?' do
    it 'should return false' do
      expect(link_exist?(source_link)).to be false
    end
  end
end
