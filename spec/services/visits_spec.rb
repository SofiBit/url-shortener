
describe Visits do
  include Visits
  let(:ip) { '178.124.194.82' }

  describe 'get_country' do
    it 'should return country' do
      expect(get_country(ip)).to eq('BY')
    end
  end

  describe 'create_visit' do
    it 'should create visit' do
      link = create(:link)

      expect { create_visit(ip, link) }.to change(Visit, :count).by(1)
    end
  end
end
