module ApplicationHelper
  def btn_lg(name, path)
    link_to name, path, class: "btn btn-primary btn-lg"
  end

  def panel(title,&block)
    content_tag(:div, class: %w(panel panel-default)) do
      concat content_tag(:div, title, class: "panel-heading")
      concat content_tag(:div, class: "panel-body", &block)
    end
  end

  def list_group(&block)
    content_tag(:div, class: "list-group", &block)
  end

  def title(name,&block)
    content_tag(:div, class: %w(panel panel-default)) do
      concat content_tag(:div, name, class: "panel-heading")
      concat content_tag(:div, class: "panel-body"){
        content_tag(:div, class: "list-group", &block)
      }
    end
  end

  def list_group_item(content, path, method=:get)
    key = content.model_name.param_key
    value = content.attributes.compact.except("created_at","updated_at")

    link_to raw(content.label), [path, Hash[key,value]], class: "list-group-item", method: method
  end

  def list_item(name, path)
    link_to raw(name), path, class: "list-group-item"
  end

  def button_item(name, path)
    link_to raw(name), path, class: "list-group-item", method: :post
  end

  def select_item(name, path)
    link_to raw(name), path, class: "list-group-item", method: :patch
  end

  def delete_item(name, path)
    link_to raw(name), path, class: "list-group-item", method: :delete
  end

end
