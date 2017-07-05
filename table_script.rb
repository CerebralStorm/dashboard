#!/usr/bin/env ruby

require "uri"
require "net/https"
require "time"
require "rubygems"
require 'active_record'

# url = "http://localhost:4000/api/tables"

# uri = URI.parse(url)
# http = Net::HTTP.new(uri.host, uri.port)

# request = Net::HTTP::Post.new(uri.request_uri, 'Content-Type' => 'application/json')
# request.body = {
#   table: {
#     name: 'test'
#   }
# }.to_json

# response = http.request(request)
# puts response.body

url = "http://localhost:4000/api/rows"

uri = URI.parse(url)
http = Net::HTTP.new(uri.host, uri.port)

request = Net::HTTP::Post.new(uri.request_uri, 'Content-Type' => 'application/json')
request.body = {
  row: {
    table_id: 1,
    data: {some_key:'some_value'}
  }
}.to_json

response = http.request(request)
puts response.body