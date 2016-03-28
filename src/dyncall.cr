macro share_methods(is_instance?, method_names)
  def {{is_instance? ? "shared".id : "self.shared".id}}
    {{method_names}}
  end

  def {{is_instance? ? "shared?".id : "self.shared?".id}}
    {{method_names}}.includes? method
  end

  def {{is_instance? ? "call".id : "self.call".id}}(method, args = [] of String)
    method = method.try &.to_s
    case method
      {% for method in method_names %}
      when "{{method.id}}" then {{method.id}} args.to_a
      {% end %}
      else raise "You tried to call {{(is_instance? ? "static method" : "class method").id}} \"#{method}\" method which is not shared or does not exist."
    end
  end
end

macro share_class_methods(*method_names)
  share_methods false, {{method_names.id}}
end

macro share_instance_methods(*method_names)
  share_methods true, {{method_names.id}}
end

