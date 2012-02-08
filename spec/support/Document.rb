class Document < ActiveRecord::Base
  boolean_datepicker_on :ok,[:another_ok, :custom_date]
end