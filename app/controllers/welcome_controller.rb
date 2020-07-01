class WelcomeController < ApplicationController
layout "home"

    def home
      @video = "braille-cover.mp4"
    end

end
