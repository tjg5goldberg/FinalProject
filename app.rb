require 'sinatra'
require 'sinatra/activerecord'

configure(:development){set :database, {adapter: "sqlite3", database: "sinatraDatabase.sqlite3"}}

require './models'

set :sessions, true

def current_user
	if session[:user_id]
		@current_user = User.find(session[:user_id])
		puts "\n\n \t#{@current_user.username}, #{@current_user.id} \n\n"
	end
end

get '/' do
	erb :sign_up
end

get '/sign-in' do
	erb :sign_in
end

post '/sign-in-process' do
  	@user = User.where(username: params[:username]).first
  if @user.password = params[:password]
	session[:user_id] = @user.id
	puts "\n\n \t#{session[:user_id]}, #{@user.username} \n\n"
    redirect "/welcome"
  else
    redirect "/"
  end
end

get '/index' do
	erb :index
end

post '/sign-up-process' do
	User.create(username: params[:username], password: params[:password])
	Profile.create(fname: params[:fname], lname: params[:lname], user_id: User.find_by_username(params[:username]).id)
	redirect('/sign-in')
end

get '/welcome' do
	current_user
	@current_user.id
	@username = @current_user.username
	erb :welcome
end

get '/notes' do
	current_user
	@username = @current_user.username
	# Note.create(text: params[:text], user_id: @current_user.id)
	erb :notes
end

post '/notes_process' do
	current_user
	@username = @current_user.username
	if(!Classs.find_by_subject(params[:subject]).blank?)
		Note.create(user_id: @current_user.id, classs_id: Classs.find_by_subject(params[:subject]).id, text: params[:note])
	end
	redirect('/notes')
end


get '/enroll-classses' do
	current_user
	@username = @current_user.username
	erb :enroll_classses
end

post '/enroll-classses-process' do
	current_user
	@username = @current_user.username
	if(!Classs.find_by_teacher(params[:teacher]).blank?)
		UserClasss.create(user_id: @current_user.id, classs_id: Classs.find_by_teacher_and_subject(params[:teacher], params[:classs]).id)
	else
		redirect('/enroll-classses')
	end
	redirect('/classses')
end


get '/classses' do
	current_user
	@username = @current_user.username
	@classses = UserClasss.where(user_id: @current_user.id)
	erb :classses
end







