# Encoding: utf-8
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

# debug off
set :show_exceptions, false

class Posts < ActiveRecord::Base
    validates :post_title, uniqueness: true
    validates :post_body, uniqueness: true

end

class Comments < ActiveRecord::Base
end

before do
@title, @subtitle = "Clean Blog", "A Blog Theme by Start Bootstrap"
end

get '/' do
    @title = 'Main blog page'
    @posts = Posts.order(id: :desc)
    erb :index
  end

get '/new' do
    @c = Posts.new
    @title = 'New post'
    erb :newpost
  end

post '/new' do
    @title = 'New post'
    @c = Posts.new params[:post]
    if @c.save
      
      #erb :newpost
      redirect to ('/')
      @message, @type = 'Post created', 'info'
    else
      @message, @type = @c.errors.full_messages.first, 'warning'
    erb :newpost
    end
  end

  get '/post/:post_id' do
    @post = Posts.find params[:post_id]
    erb :post
end
