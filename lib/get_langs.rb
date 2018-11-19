module Yandex
  class Translator

    module GetLang
      def self.get_lang(ui)
        url = "https://translate.yandex.net/api/v1.5/tr.json/getLangs?ui=#{ui}&key=#{$key}"
        Translator.request(url)
      end
    end

  end
end