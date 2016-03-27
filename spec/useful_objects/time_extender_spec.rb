RSpec.describe UsefulObjects::TimeExtender do
  using UsefulObjects::TimeExtender

  describe 'instance methods' do
    describe 'millisec' do
      subject { value.millisec }

      context 'not include millisec' do
        let(:value) { Date.new(2000, 1, 1).to_time }
        it { is_expected.to eq 0 }
      end

      context 'include millisec' do
        let(:value) { Time.at(946_652_400.001) }
        it { is_expected.to eq 1 }
      end
    end

    describe 'to_time' do
      subject { value.to_time }

      context 'value is integer' do
        let(:value) { 946652400 }
        it { is_expected.to be_instance_of Time }
      end

      context 'value is float' do
        let(:value) { 946652400.001 }
        it { is_expected.to be_instance_of Time }
      end
    end
  end
end
