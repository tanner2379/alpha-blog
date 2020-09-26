module ApplicationHelper

    #uses gravatar, change to use saved image
    def avatar_for(user, options = {size: 80})
        email_address = user.email.downcase
        hash = Digest::MD5.hexdigest(email_address)
        size = options[:size]
        avatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(avatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
    end

    def current_user
        #keeps current user stored locally after called the first time so
        #that the database does not need queried on each call
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        #turns current_user into a boolean
        !!current_user
    end
end
