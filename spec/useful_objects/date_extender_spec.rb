RSpec.describe UsefulObjects::DateExtender do
  using UsefulObjects::DateExtender

  describe 'instance methods' do
    describe 'step_by_unit' do
      subject { head.step_by_unit(tail, unit: unit).to_a }

      let(:head) { Date.new 2000, 1, 1 }
      let(:tail) { Date.new 2010, 1, 1 }

      context 'default unit' do
        subject { head.step_by_unit(tail).to_a }
        its([1]) { is_expected.to eq head.next_day }
      end

      context 'step by day' do
        let(:unit) { :day }
        its([0]) { is_expected.to eq head }
        its([1]) { is_expected.to eq head.next_day }
        its(:last) { is_expected.to eq tail }
      end

      context 'step by month' do
        let(:unit) { :month }
        its([0]) { is_expected.to eq head }
        its([1]) { is_expected.to eq head.next_month }
        its(:last) { is_expected.to eq tail }
      end

      context 'step by year' do
        let(:unit) { :year }
        its([0]) { is_expected.to eq head }
        its([1]) { is_expected.to eq head.next_year }
        its(:last) { is_expected.to eq tail }
      end

      context 'step by week' do
        let(:unit) { :week }
        its([0]) { is_expected.to eq head }
        its([1]) { is_expected.to eq head + 7 }
        its(:last) { is_expected.to eq tail }
      end
    end
  end
end
