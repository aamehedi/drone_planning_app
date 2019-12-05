module ApplicationHelper
  def string_to_hash(json_string)
    YAML.load json_string.gsub('=>', ':')
  end
end
