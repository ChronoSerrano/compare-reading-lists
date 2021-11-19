# frozen_string_literal: true

require "csv"
require_relative "../config/environment"

def load_csv(filename:, separator: ",", quote_char: '"')
  csv_text = File.read(Config.root.join("lib", "seeds", filename))
  CSV.parse(csv_text, headers: true, encoding: "ISO-8859-1", col_sep: separator, quote_char: quote_char)
end

# load_csv(filename: 'goodreads.csv').each do |row|
#   next if row['Exclusive Shelf'].eql? 'to-read'

#   t = Goodreads.new
#   t.Title = row['Title']
#   t.Author = row['Author']
#   t.AuthorLF = row['Author l-f']
#   t.BookId = row['Book Id']
#   t.isbn = if row['isbn13'].present?
#              row['isbn13'].gsub('=', '')
#            elsif row['isbn'].present?
#              row['isbn'].gsub('=', '')
#            else
#              ''
#            end
#   t.save!
# end

# puts "There are now #{Goodreads.count} rows in the goodreads table"

load_csv(filename: "calibre.csv").each do |row|
  t = Calibre.new
  t.title = row["title"]
  t.author_sort = row["author_sort"]
  t.authors = row["authors"]
  t.isbn = row["isbn"]
  t.goodreads_id = row["#goodreads"]
  t.librarything_id = row["#librarything_id"]
  t.WorkId = row["#oclc_owi"]
  t.save!
end

puts "There are now #{Calibre.count} rows in the calibre table"

# load_csv(filename: 'storygraph.csv').each do |row|
#   t = Storygraph.new
#   t.Title = row['Title']
#   t.Authors = row['Authors']
#   t.isbn = row['isbn']
#   t.save!
# end

# puts "There are now #{Storygraph.count} rows in the storygraph table"

load_csv(filename: "librarything.tsv", separator: "\t", quote_char: nil).each do |row|
  t = LibraryThing.new
  t.isbn = if row["ISBNs"].nil?
    ""
  elsif row["ISBNs"][/\d{13}/].present?
    row["ISBNs"][/\d{13}/]
  elsif row["ISBNs"][/\b\d{9}(\d|X)\b/].present?
    row["ISBNs"][/\b\d{9}(\d|X)\b/]
  end
  t.BookId = row["Book Id"]
  t.Title = row["Title"]
  t.PrimaryAuthor = row["Primary Author"]
  t.SecondaryAuthor = row["Secondary Author"]
  t.oclc = row["OCLC"]
  t.WorkId = row["Work id"]
  t.save!
end

puts "There are now #{LibraryThing.count} rows in the librarything table"
