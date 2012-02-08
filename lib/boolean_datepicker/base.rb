module BooleanDatePicker

  module Base

    def self.included base
      base.class_eval do
        base.extend ClassMethods
      end
    end

    module ClassMethods
      def boolean_datepicker_on *fields
        fields.each do |f|
          boolean_field,date_field = f.is_a?(Array) ? [f.first,f.last] : [f,f]
          send(:define_method,"boolean_datepicker_on_#{boolean_field}") do
            if send("#{boolean_field}_changed?")
              val =  self.send("#{boolean_field}") ? Time.now : nil
              date_field_name = send(:respond_to?,"date_#{date_field}=") ? "date_#{date_field}=" : "#{date_field}="
              send(date_field_name,val)
            end
          end
          before_save "boolean_datepicker_on_#{boolean_field}".to_sym
        end
      end
    end

  end

end

ActiveRecord::Base.send :include, BooleanDatePicker::Base
