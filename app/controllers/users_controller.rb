class UsersController < ApplicationController
	# rendering (erb :page) should happen from a get request, not from a post, patch or delete request (that's when we use redirect)

	get '/login' do
		erb :login
	end

	post '/login' do
		@user = User.find_by(email: params[:email])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect "/users/#{@user.id}"
		else

		end
	end

	get '/signup' do
		erb :signup
	end

	post '/users' do
		@user = User.new(params)
		if @user.save
			redirect "/users/#{@user.id}"
		end
	end

	get '/users/:id' do
		@user = User.find_by(id: params[:id])
		
		erb :'/users/show'
	end
end