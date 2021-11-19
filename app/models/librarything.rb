# frozen_string_literal: true

require "active_record"

class LibraryThing < ActiveRecord::Base
  self.table_name = "librarything"
end
