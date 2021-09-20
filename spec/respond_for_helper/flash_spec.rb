class FlashesController < Struct.new(:controller_path, :action_name)
end

describe RespondForHelper::Flash do
  let(:controller) { FlashesController.new('flashes', 'show') }
  let(:type) { :notice }
  let(:options) { {} }
  let(:message) { described_class.new(controller, type, options).call }

  after do
    debug message
  end

  context 'notice' do
    context 'create' do
      let(:controller) { FlashesController.new('flashes', 'create') }
      let(:type) { :notice }

      it 'generates message' do
        expect(message).to include('Successfully created')
      end
    end

    context 'update' do
      let(:controller) { FlashesController.new('flashes', 'update') }
      let(:type) { :notice }

      it 'generates message' do
        expect(message).to include('Successfully updated')
      end
    end

    context 'destroy' do
      let(:controller) { FlashesController.new('flashes', 'destroy') }
      let(:type) { :notice }

      it 'generates message' do
        expect(message).to include('Successfully destroyed')
      end
    end

    context 'default' do
      let(:controller) { FlashesController.new('flashes', 'default') }
      let(:type) { :notice }

      it 'generates message' do
        expect(message).to include('Succeeded')
      end
    end
  end

  context 'alert' do
    context 'create' do
      let(:controller) { FlashesController.new('flashes', 'create') }
      let(:type) { :alert }

      it 'generates message' do
        expect(message).to include('Failed to create')
      end
    end

    context 'update' do
      let(:controller) { FlashesController.new('flashes', 'update') }
      let(:type) { :alert }

      it 'generates message' do
        expect(message).to include('Failed to update')
      end
    end

    context 'destroy' do
      let(:controller) { FlashesController.new('flashes', 'destroy') }
      let(:type) { :alert }

      it 'generates message' do
        expect(message).to include('Failed to destroy')
      end
    end

    context 'default' do
      let(:controller) { FlashesController.new('flashes', 'default') }
      let(:type) { :alert }

      it 'generates message' do
        expect(message).to include('Failed')
      end
    end
  end

  context 'flash options' do
    let(:controller) { FlashesController.new('flashes', 'create') }
    let(:type) { :notice }
    let(:options) { { success_num: 10, failure_num: 20 } }

    it 'generates message' do
      expect(message).to include('10 succeeded')
      expect(message).to include('20 failed')
    end
  end

  context 'custom message' do
    let(:controller) { FlashesController.new('flashes', 'create') }
    let(:type) { :notice }
    let(:options) { { notice: 'Custom message' }  }

    it 'generates message' do
      expect(message).to include('Custom message')
    end
  end

  context 'controller specific message' do
    let(:controller) { FlashesController.new('flashes', 'action') }
    let(:type) { :notice }

    it 'generates message' do
      expect(message).to include('Flashes succeeded')
    end
  end
end
