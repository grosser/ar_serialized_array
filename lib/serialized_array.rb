class ActiveRecord::Base
  def self.serialized_array(attr_name, options={})
    options[:on_set] ||= lambda{|x|x}

    #getter
    define_method attr_name do
      YAML.load(read_attribute(attr_name).to_s) || []
    end

    #setter
    define_method "#{attr_name}=" do |value|
      write_attribute attr_name, options[:on_set].call(value).to_yaml
    end

    #accessors e.g. xxx_as_text
    if options[:accessor]
      #getter
      define_method options[:accessor] do
        send(attr_name) * ", "
      end

      #setter
      define_method "#{options[:accessor]}=" do |value|
        send "#{attr_name}=", value.split(',').reject(&:blank?).map(&:strip)
      end
    end
  end
end