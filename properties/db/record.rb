require 'sinatra/activerecord'

module Properties
  module Db
    # ActiveRecord class for communication with DB.
    # All validation and other logic should be in Repositories.
    class Record < ActiveRecord::Base
      self.table_name = "properties"
    end
  end
end