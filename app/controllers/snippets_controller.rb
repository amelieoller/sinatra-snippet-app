class SnippetsController < ApplicationController

	get '/snippets' do
		@snippets = Snippet.all
		erb :'/snippets/index'
	end

	get '/snippet' do 
		erb :snippet
	end

	get '/snippets/new' do 
		erb :'/snippets/new'
	end

	post '/snippets' do
		if !logged_in?
			redirect '/'
		end

		if params[:content] != ""
			snippet = Snippet.create(content: params[:content], user: current_user)
			redirect "/snippets/#{snippet.id}"
		else
			redirect '/snippets/new'
		end
	end
end