class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(username: params[:session][:username])
        puts user.inspect
        if user && user.authenticate(params[:session][:password])
            puts "Authentication successful"
            session[:user_id] = user.id
            flash[:notice] = "Login successful"

            redirect_to root_path
        else
            puts "Authentication failed"
            flash.now[:error] = "Username and/or password not recognized"
            render 'new', status: :unprocessable_entity
        end
    end

    def destroy
     
        session[:user_id] = nil
        session[:params]=nil
        flash[:notice]="Logged out"
        
        redirect_to login_path
    end
  
end