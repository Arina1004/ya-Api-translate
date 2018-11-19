require 'minitest/autorun'
require_relative '../lib/yandex_translator'

class YandexTranslatorTest < Minitest::Test
  API_KEY = 'trnsl.1.1.20181113T124855Z.265a3dbb4ed09a6b.898310b6c4a33ca9d35f5d9c39561a578b93a8b3'

  def test_get_langs
    res = Yandex::Translator.new(API_KEY).get_langs('ru')
    assert res['dirs'].is_a?(Array)
    assert res['langs'].is_a?(Hash)
  end

  def test_get_langs_with_wrong_ui
    res = Yandex::Translator.new(API_KEY).get_langs('xyz')
    assert_equal('Russian', res['langs']['ru'])
  end

  def test_detect_lang
    assert_equal('de', Yandex::Translator.new(API_KEY).detect_lang('Guten Tag!'))
  end

  def test_translate
    assert_equal('morgen', Yandex::Translator.new(API_KEY).translate('утро', 'de', 'ru'))
    assert_equal('morgen', Yandex::Translator.new(API_KEY).translate('утро', 'de'))
  end
end