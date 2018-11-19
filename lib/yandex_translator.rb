module Yandex
  class APIError < StandardError
  end

  class Translator
    require 'net/http'
    require 'json'

    def initialize(api_key)
      @api_key = api_key
      @base_url = "https://translate.yandex.net/api/v1.5/tr.json"
    end

    def detect_lang(text, hint = '')
      params = {"text" => text, "hint" => hint}
      response = post!(detect_language_endpoint, params)
      begin
        JSON.parse(response)["lang"]
      rescue e
        raise APIError.new(e.message)
      end
    end

    def get_langs(ui)
      url = get_langs_endpoint(ui)
      response = Net::HTTP.get(url)
      JSON.parse(response)
    end

    def translate(text, last_lang, first_lang = nil, format = 'plain')
      direction = first_lang ? "#{first_lang}-#{last_lang}" : last_lang
      params = {"text" => text, "lang" => direction, "format" => format}
      response = post!(translate_endpoint, params)
      begin
        JSON.parse(response)["text"].first
      rescue e
        raise APIError.new(e.message)
      end
    end

    private

    def post!(uri, params)
      response = Net::HTTP.post_form(uri, params)
      if response.code == "200"
        response.body
      else
        raise APIError.new(response.body)
      end
    end

    def get_langs_endpoint(ui)
      URI.parse("#{@base_url}/getLangs?key=#{@api_key}&ui=#{ui}")
    end

    def detect_language_endpoint
      URI.parse("#{@base_url}/detect?key=#{@api_key}")
    end

    def translate_endpoint
      URI.parse("#{@base_url}/translate?key=#{@api_key}")
    end
  end
end