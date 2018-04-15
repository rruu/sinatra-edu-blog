# Encoding: utf-8
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

class Posts < ActiveRecord::Base
    #validates :title, presence: true, length: {maximum: 100}
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
      @message = 'Post created'
    else
      @message, @type = @c.errors.full_messages.first, 'warning'
    erb :visit
    end
  end

get "/posts" do
    erb :post
  end