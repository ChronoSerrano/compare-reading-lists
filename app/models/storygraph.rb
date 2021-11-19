# frozen_string_literal: true

require 'active_record'

# Can override table name and primary key
class Storygraph < ActiveRecord::Base
  self.table_name = 'storygraph'
end
