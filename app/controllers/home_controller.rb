class HomeController < ApplicationController
	require 'socket'

	def home
		ip= private_ip.ip_address unless private_ip.nil?
		@host = ip
	end

	def private_ip
		Socket.ip_address_list.detect{|intf| intf.ipv4_private?}
	end

end