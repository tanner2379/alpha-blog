class ApplicationController < ActionController::Base
    
    #makes current_user available to views as well
    helper_method :current_user, :logged_in?

    def current_user
        #keeps current user stored locally after called the first time so
        #that the database does not need queried on each call
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        #turns current_user into a boolean
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:alert] = "You must be logged in to perform that action"
            redirect_to login_path
        end
    end

end
