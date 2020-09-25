module ApplicationHelper

    #uses gravatar, change to use saved image
    def avatar_for(user, options = {size: 80})
        email_address = user.email.downcase
        hash = Digest::MD5.hexdigest(email_address)
        size = options[:size]
        avatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(avatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
    end
end
