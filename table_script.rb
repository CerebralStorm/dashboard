#!/usr/bin/env ruby

require "uri"
require "net/https"
require "time"
require "rubygems"
require 'active_record'

url = "http://localhost:4000/api/tables"

def create_record(url, body)
  uri = URI.parse(url)
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new(uri.request_uri, 'Content-Type' => 'application/json')
  request.body = body.to_json
  response = http.request(request)
  puts response.body
end

create_record("http://localhost:4000/api/tables",
  {
    table: {
      name: 'Contact Table'
    }
  }
)

create_record("http://localhost:4000/api/rows",
  {
    row: {
      table_id: 1,
      data: {
        name:'John Smith',
        phone: '801-444-4444',
        address: '123 Terrace Ln.'
      }
    }
  }
)

create_record("http://localhost:4000/api/columns",
  {
    column: {
      table_id: 1,
      name: 'Name',
      table_key: 'name',
      position: 0
    }
  }
)

create_record("http://localhost:4000/api/columns",
  {
    column: {
      table_id: 1,
      name: 'Phone Number',
      table_key: 'phone',
      position: 1
    }
  }
)

create_record("http://localhost:4000/api/columns",
  {
    column: {
      table_id: 1,
      name:'Address',
      table_key: 'address',
      position: 2
    }
  }
)