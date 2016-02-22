class TodoFetcher
  class << self
    def fetch_list
      parsed_list.each_with_object([]) do |json, list|
        list << TodoItem.new(json)
      end
    end

    private

    def parsed_list
      request = UcfCanvasApi.new(Dashboard.CONFIG[:canvas_auth_key]).todo
      return [] unless request[:status][/200/]
      request[:response]
    end
  end
end