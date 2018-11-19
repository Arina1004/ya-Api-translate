# Yandex Translator API

### How to use

```ruby
  require 'yandex_translator'
  # create an instance using your API key
  @translator = Yandex::Translator.new(API_KEY)
  # to get all available language and translation directions
  @translator.get_langs('ru')
  # to translate from Russian to German
  @translator.translate('утро', 'de', 'ru')
  # to detect language of the text
  @translator.detect_lang('Guten Tag!')
```

### To run tests

`ruby test/yandex_translator_test.rb`