#! /usr/bin/env ruby
require 'addressable/uri'
require 'rest-client'

def random_str(length)
  (1..length).map{("a".."z").to_a.sample}.join
end


def update_user(id, username = nil)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/users/#{id}.html"
  ).to_s

  user = {}
  user[:username] = username unless username.nil?

  puts RestClient.patch(url, {user: user})
end

def create_user(username=nil)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.html'#
  ).to_s

  payload = {
    user: {
      username: username
    }
  }

  puts RestClient.post(url, payload)
end

def show_user(id)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/users/#{id}.html"
  ).to_s

  puts RestClient.get(url)

end

def delete_user(id)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/users/#{id}.html"
  ).to_s

  puts RestClient.delete(url)

end

def index_users
    url = Addressable::URI.new(
      scheme: 'http',
      host: 'localhost',
      port: 3000,
      path: '/users.html'
    ).to_s

    puts RestClient.get(url)
end

if __FILE__ == $PROGRAM_NAME
  action = ARGV.first
  if action.nil?
    puts "You need to specify an action"
    exit
  end
  begin
    self.send(action.to_sym, *ARGV.drop(1))
  rescue NameError => ne
    puts "Invalid action name."
  rescue RestClient::Exception => rce
    if rce.http_code == 302
      rce.response.follow_redirection
    else
      puts "Request returned HTTP Error Code: #{rce.http_code}"
      puts "Message: #{ rce.http_code == 422 ? rce.http_body : rce.message}"
    end
  end
end
