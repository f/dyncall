macro share(*method_names)
  def self.shared
    {{method_names}}
  end

  def self.shared?(method)
    {{method_names}}.includes? method
  end

  def self.call(method, args = [] of String)
    method = method.try &.to_s
    case method
      {% for method in method_names %}
      when "{{method.id}}" then {{method.id}} args.to_a
      {% end %}
      else raise "You tried to call \"#{method}\" method which is not shared or does not exist."
    end
  end
end
