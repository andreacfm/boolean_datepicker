RSpec::Matchers.define :have_boolean_datepicker_on do |attribute|
  match do |model|
    m = model.respond_to?(:new) ? model.new : model
    m.respond_to?("boolean_datepicker_on_#{attribute}")
  end
end
