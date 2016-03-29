RSpec.describe UsefulObjects::IteratorExtender do
  using UsefulObjects::IteratorExtender

  describe 'instance methods' do
    describe 'map_with_object' do
      shared_examples_for 'work even if I give proc symbol' do
        subject { iterator.map_with_object(:*, 2) }
        it { is_expected.to include('aa', 'bb', 'cc') }
      end

      shared_examples_for 'work even if I give block' do
        subject { iterator.map_with_object(2) { |item, arg| item * arg } }
        it { is_expected.to include('aa', 'bb', 'cc') }
      end

      context 'when iterator is array' do
        let(:iterator) { %w(a b c) }
        it_behaves_like 'work even if I give proc symbol'
        it_behaves_like 'work even if I give block'
      end

      context 'when iterator is enumerator' do
        let(:iterator) { %w(a b c).to_enum }
        it_behaves_like 'work even if I give proc symbol'
        it_behaves_like 'work even if I give block'
      end
    end
  end
end
