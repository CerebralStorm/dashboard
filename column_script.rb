#!/usr/bin/env ruby

require "uri"
require "net/https"
require "time"
require "rubygems"
require 'active_record'

TABLE_URL = "http://localhost:4000/columns"

uri = URI.parse(TABLE_URL)
http = Net::HTTP.new(uri.host, uri.port)

request = Net::HTTP::Post.new(uri.request_uri, 'Content-Type' => 'application/json')
request.body = {
  column: {
    name: 'test',
    position: 0,
    table_id: 1
  }
}.to_json

response = http.request(request)
puts response.body