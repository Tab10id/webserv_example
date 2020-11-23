# frozen_string_literal: true

require 'socket'
require_relative 'lib/request'
require_relative 'lib/response'
require 'slim'


server = TCPServer.new('localhost', 3333)
puts 'Server started on: http://localhost:3333/'

while (session = server.accept)
  request = session.gets
  next unless request

  puts request

  response = Response.new(Request.new(request), "#{__dir__}/web_root")
  session.print response.to_s
  session.close
end
