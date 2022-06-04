module RespondForHelper
  class Lookup
    def initialize(controller, options)
      @controller = controller
      @options = options
    end

    def call
      formats = resolve_formats
      Config.formats.select { |f| formats.include?(f) }.to_h
    end

    private

    def resolve_formats
      if @options[:formats]
        Array(@options[:formats])
      else
        Config.formats.keys
      end
    end
  end
end
