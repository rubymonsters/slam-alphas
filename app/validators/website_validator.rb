class WebsiteValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A(http|https):\/\/[a-z0-9]+([\.]{1}[a-z0-9]+)*\.[a-z]{2,5}\z/
      record.errors[attribute] << (options[:message] || "not a valid url, should start with 'http://' or 'https://'")
    end
  end
end
