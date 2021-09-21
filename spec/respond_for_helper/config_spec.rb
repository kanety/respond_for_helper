describe RespondForHelper::Config do
  context 'configure' do
    before do
      RespondForHelper.configure do |config|
        config.flash = nil
      end
    end

    after do
      RespondForHelper.configure do |config|
        config.flash = RespondForHelper::Flashes::Timestamp
      end
    end

    it 'gets and sets' do
      expect(RespondForHelper.config.flash).to eq(nil)
    end
  end
end
