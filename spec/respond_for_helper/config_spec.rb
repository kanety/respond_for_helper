describe RespondForHelper::Config do
  context 'configure' do
    before do
      RespondForHelper.configure do |config|
        config.flasher = nil
      end
    end

    after do
      RespondForHelper.configure do |config|
        config.flasher = RespondForHelper::Flashes::Timestamp
      end
    end

    it 'gets and sets' do
      expect(RespondForHelper.config.flasher).to eq(nil)
    end
  end
end
