RSpec.describe UsefulObjects::StringExtender do
  using UsefulObjects::StringExtender

  describe 'instance methods' do
    describe 'parse_json' do
      subject { value.parse_json }

      context 'when value is json' do
        let(:value) { '{ "foo": "foo", "bar": 1 }' }
        it { is_expected.to include('foo' => 'foo', 'bar' => 1) }
      end

      context 'when value is not json' do
        let(:value) { '{ "foo": foo, "bar": 1 }' }
        it { is_expected.to be_nil }
      end
    end
  end
end
