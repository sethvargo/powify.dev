class HomeController < ApplicationController
    def home
    	io = IO.popen('ifconfig')
		ifconfig = io.readlines
		ip = ifconfig[11].scan(/\ \d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\ /)
		@host = ip.to_s[3..-4]
    end
end