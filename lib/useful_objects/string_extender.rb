require 'json'

module UsefulObjects
  # External String methods.
  module StringExtender
    refine String do
      def parse_json
        JSON.parse(self)
      rescue JSON::ParserError => _e
        nil
      end
    end
  end
end
