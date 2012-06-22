module FeathersHelper
  def feather_cms_include_tag
    javascript_include_tag('codemirror', 'modes/htmlmixed', 'modes/javascript',
                           'modes/xml', 'modes/css', 'feather_cms') + 
                           stylesheet_link_tag('codemirror')
  end

  def feather_cms_template(object_name, method, options = {})
    options[:class] = "#{options[:class]} codemirror_feather_cms"
    text_area(object_name, method, options = {})
  end

  def feather_cms_template_tag(name, content = nil, options = {})
    options[:class] = "#{options[:class]} codemirror_feather_cms"
    text_area_tag(name, content = nil, options = {})
  end

end
