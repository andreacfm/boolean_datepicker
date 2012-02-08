require "spec_helper"

describe "boolean_datepicker" do

  describe "methods generation"  do

    it "should have method boolean_datepicker available to ActiveRecord::Base" do
      ActiveRecord::Base.singleton_methods.grep(/boolean_datepicker_on/).should_not be_nil
    end

    it "should generate instance method boolean_datepicker_on_ok" do
      Document.new.should respond_to(:boolean_datepicker_on_ok)
    end

  end

  describe "when creating a new record" do

    it "should set date_ok field if ok is true when model is created" do
      doc = Document.create!(:ok => true)
      doc.date_ok.should_not be_nil
    end

  end

  describe "before_save" do

    it "should set the date_ok field to Time.now if ok is true" do
      doc = Document.new(:ok => true)
      doc.save!
      doc.date_ok.should_not be_nil
    end

    it "should not change the date_ok field if ok is true but has not been changed" do
      doc = Document.create!(:ok => true)
      date = doc.date_ok
      doc.save!
      doc.date_ok.should eq date
    end

    it "should set the date_ok field to nil if ok value is not true" do
      doc = Document.new(:ok => false)
      doc.save!
      doc.date_ok.should be_nil
    end

    it "should set the date_ok field to nil if ok value was true but has been changed into not true" do
      doc = Document.new(:ok => true)
      doc.save!
      doc.date_ok.should_not be_nil
      doc.ok = false
      doc.save!
      doc.date_ok.should be_nil
    end

  end

  describe "custom date field name" do

    it "should save the date on a custom date field" do
      doc = Document.create!(:another_ok => true)
      doc.save!
      doc.custom_date.should_not be_nil
    end

  end


end