The gem trace the datetime of the last time a boolean field has been saved with e true value.
###Installation
    gem "boolean-datepicker"
###Usage
Use the macro boolean_datepicker_on to define the boolean column you want to trace

    boolean_datepicker_on :my_boolean_field

By default the datetime column required will "date_{my_field_date}". You can use a custom date column name passing a secon array elemnt like:

    boolean_datepicker_on :my_boolean_field, [:another_boolean, :custom_date_field]

Anytime the boolena field is setted to true (and is modified from a precedent different value) the date column field is filled with the Time.now value.
Anyother value passed ot the boolean field rest the date filed to nil.
Gem uses the before_save callbacks

###Rspec matcher
    it {should have_boolean_datepicker_on(:my_field)}

