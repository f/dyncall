macro share(*method_names)
  def self.shared
    {{method_names}}
  end

  def self.shared?(method)
    {{method_names}}.includes? method
  end

  def call(method, args = {nil: nil})
    method = method.try &.to_s
    case method
      {% for method in method_names %}
      when "{{method.id}}" then {{method.id}} args.to_h
      {% end %}
      else raise "You tried to call \"#{method}\" method which is not shared or does not exist."
    end
  end
end
