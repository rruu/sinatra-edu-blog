# Encoding: utf-8
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

# debug off
#set :show_exceptions, false

class Posts < ActiveRecord::Base
    #validates :post_title, presence: true, length: {minimum: 3}
    #validates :postbody, presence: true, length: {maximum: 100}

end

class Comments < ActiveRecord::Base
end

before do
@title, @subtitle = "Clean Blog", "A Blog Theme by Start Bootstrap"
end

get '/' do
    @title = 'Main blog page'
    @posts = Posts.all
    erb :index
  end

get '/new' do
    @title = 'New post'
    erb :newpost
  end

post '/new' do
    @title = 'New post'
    @c = Posts.new params[:post]
    if @c.save
      @message, @type = 'Post created', 'info'
      erb :newpost
    else
      @message, @type = @c.errors.full_messages.first, 'warning'
    erb :newpost
    end
  end

  get '/post/:post_id' do
    @post = Posts.find params[:post_id]
    erb :post
end
