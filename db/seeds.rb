

require 'byebug'
require_relative '../app/models/url.rb'

values = File.open("urls", "r").each do |line|
    @new_url = Url.new(long_url: line.tr('(),\n','').squish)
    @new_url.save
end

# class UrlsImporter

# #   def self.import(filename)
#     long_url_arr = []
#     short_url_arr = []
#     File.open('urls', 'r').each do |line|
#       long_url_arr << line.tr(";(),\n","").squish
#       short_url_arr << Url.new.shorten
#       # byebug
#     end

#       Url.transaction do
#         long_url_arr.count.times do |m|
#           byebug
#           Url.connection.execute "INSERT INTO urls (long_url, shorten_url) VALUES (#{long_url_arr[m]}, #{short_url_arr[m]})"
#         end
#       end
# #   end
# # end