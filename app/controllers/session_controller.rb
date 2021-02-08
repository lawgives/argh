# frozen_string_literal: true

class SessionController < ApplicationController
  layout 'application'

  def index
    output = StringIO.new
    output.puts request.headers['HTTP_COOKIE']
    output.puts "session.loaded?=#{session.loaded?}"
    output.puts "Before: session[:testing]=#{session[:testing]}"
    session[:testing] = Time.now.to_s
    output.puts "After: session[:testing]=#{session[:testing]}"
    render plain: output.string
  end
end
