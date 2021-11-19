# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'btree_gin'
  enable_extension 'btree_gist'
  enable_extension 'citext'
  enable_extension 'cube'
  enable_extension 'dblink'
  enable_extension 'dict_int'
  enable_extension 'dict_xsyn'
  enable_extension 'earthdistance'
  enable_extension 'fuzzystrmatch'
  enable_extension 'hstore'
  enable_extension 'intarray'
  enable_extension 'ltree'
  enable_extension 'pg_stat_statements'
  enable_extension 'pg_trgm'
  enable_extension 'pgcrypto'
  enable_extension 'pgrowlocks'
  enable_extension 'pgstattuple'
  enable_extension 'plpgsql'
  enable_extension 'postgis'
  enable_extension 'tablefunc'
  enable_extension 'unaccent'
  enable_extension 'uuid-ossp'
  enable_extension 'xml2'

  create_table 'calibre', force: :cascade do |t|
    t.text 'isbn'
    t.text 'title'
    t.text 'author_sort'
    t.text 'authors'
    t.integer 'goodreads_id'
    t.integer 'librarything_id'
    t.text 'WorkId'
  end

  create_table 'goodreads', default: nil, force: :cascade do |t|
    t.text 'Title'
    t.text 'Author'
    t.text 'AuthorLF'
    t.text 'BookId'
    t.text 'isbn'
  end

  create_table 'librarything', force: :cascade do |t|
    t.integer 'BookId'
    t.text 'Title'
    t.text 'PrimaryAuthor'
    t.text 'SecondaryAuthor'
    t.text 'isbn'
    t.text 'oclc'
    t.text 'WorkId'
  end

  create_table 'storygraph', force: :cascade do |t|
    t.text 'Title'
    t.text 'Authors'
    t.text 'isbn'
  end
end
