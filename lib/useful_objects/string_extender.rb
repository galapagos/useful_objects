require 'json'

module UsefulObjects
  # External String methods.
  module StringExtender
    refine String do
      def parse_json
        parse_json!
      rescue JSON::ParserError => _e
        nil
      end

      def parse_json!
        JSON.parse(self)
      end
    end
  end
end
