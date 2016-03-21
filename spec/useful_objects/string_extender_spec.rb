RSpec.describe UsefulObjects::StringExtender do
  using StringExtender

  describe 'instance methods' do
    describe 'parse_json' do
      subject { value.parse_json }

      context 'when value is json' do
        let(:value) { '{ "foo": "foo", "bar": 1 }' }
        it { is_expected.to include(foo: 'foo', bar: 1) }
      end

      context 'when value is not json' do
        let(:value) { '{ "foo": foo, "bar": 1 }' }
        it { is_expected.to be_nil }
      end
    end

    describe 'parse_json!' do
      subject { value.parse_json! }

      context 'when value is json' do
        let(:value) { '{ "foo": "foo", "bar": 1 }' }
        it { is_expected.to include(foo: 'foo', bar: 1) }
      end

      context 'when value is not json' do
        let(:value) { '{ "foo": foo, "bar": 1 }' }

        it 'is expected to raise JSON::ParserError' do
          expect { value.parse_json }.to raise_error JSON::ParserError
        end
      end
    end
  end
end
