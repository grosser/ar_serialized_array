require 'active_record'

module ARSerializedArray
  VERSION = File.read( File.join(File.dirname(__FILE__),'..','VERSION') ).strip
  
  def serialized_array(attr_name, options={})
    options[:on_set] ||= lambda{|x|x}

    # getter
    define_method attr_name do
      YAML.load(read_attribute(attr_name).to_s) || []
    end

    # setter
    define_method "#{attr_name}=" do |value|
      value = options[:on_set].call(value) || []
      raise "Expected an Array, got: #{value.inspect}" unless value.is_a? Array
      value = (value.empty? ? nil : value.to_yaml)
      write_attribute attr_name, value
    end

    # accessors e.g. xxx_as_text
    if options[:accessor]
      #getter
      define_method options[:accessor] do
        send(attr_name) * ", "
      end

      #setter
      define_method "#{options[:accessor]}=" do |value|
        send "#{attr_name}=", value.to_s.split(',').reject(&:blank?).map(&:strip)
      end
    end
  end
end

ActiveRecord::Base.send(:extend, ARSerializedArray)