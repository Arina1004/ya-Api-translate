module Yandex
  class Translator

    module Translate
      def self.translate(text_for_translate, last_lang, first_lang = '')
        lang = (first_lang)? "lang=#{first_lang}-#{last_lang}" : "lang=#{last_lang}"
        url = "https://translate.yandex.net/api/v1.5/tr.json/translate?key=#{$key}&text=#{text_for_translate}&#{lang}"

        Translator.request(url)["text"]
      end
    end

  end
end