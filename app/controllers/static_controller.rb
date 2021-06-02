class StaticController < ApplicationController

    def index
    end

    def sign_up
        @artist = Artist.new
    end
    
    def sign_in
    end
end
