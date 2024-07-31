describe RespondForHelper::Flashes::Timestamp do
  let(:type) { :notice }
  let(:options) { { action_name: 'show' } }
  let(:message) { described_class.new(type, options).call }

  after do
    debug message
  end

  context 'notice' do
    context 'create' do
      let(:type) { :notice }
      let(:options) { { action_name: 'create' } }

      it 'generates message' do
        expect(message).to include('Successfully created')
      end
    end

    context 'update' do
      let(:type) { :notice }
      let(:options) { { action_name: 'update' } }

      it 'generates message' do
        expect(message).to include('Successfully updated')
      end
    end

    context 'destroy' do
      let(:type) { :notice }
      let(:options) { { action_name: 'destroy' } }

      it 'generates message' do
        expect(message).to include('Successfully destroyed')
      end
    end

    context 'default' do
      let(:type) { :notice }
      let(:options) { { action_name: 'default' } }

      it 'generates message' do
        expect(message).to include('Succeeded')
      end
    end
  end

  context 'alert' do
    context 'create' do
      let(:type) { :alert }
      let(:options) { { action_name: 'create' } }

      it 'generates message' do
        expect(message).to include('Failed to create')
      end
    end

    context 'update' do
      let(:type) { :alert }
      let(:options) { { action_name: 'update' } }

      it 'generates message' do
        expect(message).to include('Failed to update')
      end
    end

    context 'destroy' do
      let(:type) { :alert }
      let(:options) { { action_name: 'destroy' } }

      it 'generates message' do
        expect(message).to include('Failed to destroy')
      end
    end

    context 'default' do
      let(:type) { :alert }
      let(:options) { { action_name: 'default' } }

      it 'generates message' do
        expect(message).to include('Failed')
      end
    end
  end

  context 'flash options' do
    let(:type) { :notice }
    let(:options) { { action_name: 'create', success_num: 10, failure_num: 20 } }

    it 'generates message' do
      expect(message).to include('10 succeeded')
      expect(message).to include('20 failed')
    end
  end

  context 'custom message' do
    let(:type) { :notice }
    let(:options) { { notice: 'Custom message' } }

    it 'generates message' do
      expect(message).to include('Custom message')
    end
  end

  context 'controller specific message' do
    let(:type) { :notice }
    let(:options) { { controller_path: 'flashes', action_name: 'action' } }

    it 'generates message' do
      expect(message).to include('Flashes succeeded')
    end
  end
end
