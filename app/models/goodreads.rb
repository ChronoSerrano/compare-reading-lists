# frozen_string_literal: true

require 'active_record'

# Can override table name and primary key
class Goodreads < ActiveRecord::Base
  self.table_name = 'goodreads'
end
