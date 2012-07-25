class HomeController < ApplicationController
    def home
    	io = IO.popen('ifconfig')
		ifconfig = io.readlines

		@ip ||= []

		ifconfig.each do |config|
			a = config.scan(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/)
			a.each do |ip|
				@ip << ip unless ip.empty? || ip.include?("127.0.0.1") || ip.include?("192.168.1.1") || ip.include?("localhost")
			end
		end

		@host = @ip[0]

    end
end