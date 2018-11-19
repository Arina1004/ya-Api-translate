module Yandex
  class Translator

    module Definition
      def self.definition(definition_text)
        url = "https://translate.yandex.net/api/v1.5/tr.json/detect?key=#{$key}&text=#{definition_text}&hint=en,ru"
        Translator.request(url)["lang"]
      end
    end

  end
end
