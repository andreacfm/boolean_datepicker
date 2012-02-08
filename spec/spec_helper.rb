# encoding: utf-8
require 'rubygems'
require 'active_record'
require 'sqlite3'

require 'boolean_datepicker'

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|f| require f}
ActiveRecord::Base.establish_connection :adapter => "sqlite3", :database  => "db/test.sqlite3"

RSpec.configure do |config|
  config.mock_with :rspec

  config.before :suite do
    ActiveRecord::Base.connection.create_table(:documents,:force => true) do |t|
       t.boolean :ok
       t.datetime :date_ok
       t.boolean :another_ok
       t.datetime :custom_date
    end
  end

  config.before(:each) do
    Document.delete_all
  end

  config.after(:suite) do
    ActiveRecord::Base.connection.drop_table(:documents)
  end
end
