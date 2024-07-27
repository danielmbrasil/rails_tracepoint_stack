module RailsTracepointStack
  module Filter
    class CustomTraceSelectorFilter
      def self.ignore_trace?(trace:)
        p RailsTracepointStack.configuration.file_path_to_filter_patterns
        p trace.file_path
        p filter_match_a_custom_pattern_to_be_not_ignored?(trace)
        return false unless RailsTracepointStack.configuration.file_path_to_filter_patterns.any?

        !filter_match_a_custom_pattern_to_be_not_ignored?(trace)
      end

      private

      def self.filter_match_a_custom_pattern_to_be_not_ignored?(trace)
        RailsTracepointStack.configuration.file_path_to_filter_patterns.any? do |pattern|
          trace.file_path.match?(pattern)
        end
      end
    end
  end
end
