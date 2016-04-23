class ModelPresenter
  include HtmlBuilder

  attr_reader :object, :view_context
  delegate :link_to, :simple_form_for, to: :view_context

  def initialize(object, view_context)
    @object = object
    @view_context = view_context
  end

end