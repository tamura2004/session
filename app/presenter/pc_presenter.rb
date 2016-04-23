class PcPresenter < ModelPresenter
  delegate :changed_attributes, :changed_attributes_label, to: :object

  def select_for_update
    markup do |m|
      m.div(class: "list-group-item") do
        m.div(class: "row") do
          m.div(class: "col-xs-10") do
            m.text changed_attributes_label
          end
          m.div(class: "col-xs-2") do
            m << simple_form_for(object) do |f|
              changed_attributes.each do |k,v|
                f.input k.to_sym, as: :hidden
              end
              f.button :submit, "選択", class: "btn btn-default btn-xs pull-right"
            end
          end
        end
      end
    end
  end

end
