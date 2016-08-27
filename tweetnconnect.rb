require 'bundler'
require 'sinatra'

Bundler.require

get '/' do
  erb :index, :layout => :layout
end

post '/updates' do
  client = Buffer::Client.new(ENV['BUFFER_ACCESS_TOKEN'])
  client.create_update(
    body: {
      text: params['text'],
      profile_ids: [ENV['BUFFER_PROFILE_ID']]
    },
  )

  redirect to('/')
end