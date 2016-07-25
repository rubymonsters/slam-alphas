require "addressable/uri"

class WebsiteValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    URLParser.parse(value)
  rescue URLInvalidError
    # if message on the left is truthy, run the code on the left otherwise run the default message on the right
    record.errors[attribute] << (options[:message] || "not a valid url, should start with 'http://' or 'https://'")
  end
end

class URLParser
  def self.parse(url)
    uri = Addressable::URI.parse(url)
    schemes = ['http', 'https']
    unless uri && uri.host && schemes.include?(uri.scheme)
      raise URLInvalidError
    end
  rescue Addressable::URI::InvalidURIError
    raise URLInvalidError # ignore addressable and raise our own error
  end
end

class URLInvalidError < StandardError
end

# record = instance of user
# attribute = any attribute
# value = user input
