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

  def list_item(name, path)
    link_to name, path, class: "list-group-item"
  end

  def button_item(name, path)
    link_to name, path, class: "list-group-item", method: :post
  end

  def select_item(name, path)
    link_to name, path, class: "list-group-item", method: :patch
  end

  def delete_item(name, path)
    link_to name, path, class: "list-group-item", method: :delete
  end


  def list_group_with_collection(collection)
    content_tag(:ul, class: "list-group") do
      collection.each do |model|
        list_group_item do



  def list_group_item
    content_tag(:li, class: "list-group-item") do
      content_tag(:div, class: "row", &block)
    end
  end

  def list_group_item_label(header_widths, collection)
    content_tag(:div, class: "col-xs-10") do
      content_tag(:div, class: "row") do
        header_widths.zip(collection).each do |w,v|
          concat content_tag(:div, v, class: "col-xs-#{w}")
        end
      end
    end
  end

  def list_group_item_button(model)
    simple_form_for(model) do |f|
      model.changed_attributes.each do |k,v|
        concat f.input k.to_sym, as: :hidden
      end
      concat f.button :submit, "選択", class: "btn btn-default btn-xs pull-right"
    end
  end

end

# .panel.panel-primary
#   .panel-heading
#     h3.panel-title リルガミン城
#   .panel-body
#     .list-group
#       = list "ギルガメッシュの酒場", :tavern_top
#       = list "冒険者の宿", :inn_top
#       = list "ボルタック商店", :trade_top
#       = list "カント寺院", :temple_top
#       = list "街外れ", :edge_top