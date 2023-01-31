# frozen_string_literal: true

# BEGIN
module Model
  module ClassMethods
    attr_reader :scheme

    def attribute(name, options = {})
      @scheme ||= {}
      @scheme[name] = options

      define_method name do
        instance_variable_get "@#{name}"
      end

      define_method "#{name}=" do |value|
        instance_variable_set "@#{name}", convert(value, options[:type])
      end
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  def initialize(attributes = {})
    self.class.scheme.each do |name, options|
      value = attributes.key?(name) ? attributes[name] : options[:default]
      instance_variable_set "@#{name}", convert(value, options[:type])
    end
  end

  def attributes
    self.class.scheme.each_with_object({}) do |(name), acc|
      acc[name] = instance_variable_get "@#{name}"
    end
  end

  private

  def convert(value, type)
    return value if type.nil? || value.nil?

    case type
    when :integer then value.to_i
    when :string then value.to_s
    when :boolean then !!value
    when :datetime then DateTime.parse(value)
    end
  end
end
# END
