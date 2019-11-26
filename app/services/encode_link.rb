require 'base64'

class EncodeLink
  attr_reader :value

  def initialize(value)
    @value = value.to_s
  end

  def encode
    encoded_value = encode_with_base(value)
    remove_unnecessary_characters(encoded_value)
  end

  private

  def remove_unnecessary_characters(encoded_value)
    encoded_value.split('').reject { |symbol| symbol !~ /[a-zA-Z]/ }.join
  end

  def encode_with_base(value)
    Base64.encode64(value)
  end
end
