class PhoneNumber
  attr_reader :value
  delegate :hash, to: :value

  def initialize(value)
    raise "Phone number is invalid" unless value.match?(/\A0\d{9,10}\z/)
    @value = value.frozen? ? value : value.dup.freeze
  end

  def ==(other)
    self.class == other.class && value == other.value
  end
  alias eql? ==

  def mobile?
    value.match?(/\A0[7-9]0\d{8}\z/)
  end
end
