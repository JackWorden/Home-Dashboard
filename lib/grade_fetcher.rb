class GradeFetcher
  class << self
    def fetch_list
      parsed_list.each_with_object([]) do |json, list|
        next unless Dashboard.CONFIG[:courses].keys.include?(json['id'])
        list << Grade.new(json)
      end
    end

    private

    def parsed_list
      request = UcfCanvasApi.new(Dashboard.CONFIG[:canvas_auth_key]).courses
      return [] unless request[:status][/200/]
      request[:response]
    end
  end
end