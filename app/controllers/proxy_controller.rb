# This class only exists because of the same-domain origin policies
# and Chrome's refusal to set headers in HTML5 docs
class ProxyController < ApplicationController
  require 'net/http'
  require 'uri'

  def result
    render :json => {
      :status => JSON.parse(make_request('http://localhost/status.json')),
      :config => JSON.parse(make_request('http://localhost/config.json')),
      :apps => JSON.parse(apps)
    }
  end

  def apps
    @pow_path = "#{File.expand_path('~/.pow')}"
    pow_apps = {}
    Dir.foreach(@pow_path) do |pow_app|
      unless %w(. .. powify).include?(pow_app)
        pow_apps[pow_app] = {
          :powconfig => powconfig(pow_app),
          :powenv => powenv(pow_app),
          :powrc => powrc(pow_app),
          :rvmrc => rvmrc(pow_app)
        }.reject{|k,v| v.nil?}
      end
    end

    pow_apps.to_json
  end

  private
  def make_request(url)
    url = URI.parse(url)

    request = Net::HTTP::Get.new(url.path)
    request.add_field('host', 'pow')

    Net::HTTP.start(url.host, url.port) {|http|
      http.request(request)
    }.body
  end

  def powconfig(pow_app)
    powconfig_path = "#{@pow_path}/#{pow_app}/.powconfig"
    powconfig = File.open(powconfig_path).readlines if File.exists?(powconfig_path)

    hash = {}
    powconfig.each do |line|
      hash[$1.strip.to_sym] = $2.strip if line =~ /\s?export\s?(.+)=(.+)/i
    end unless powconfig.nil?

    return hash.empty? ? nil : hash
  end

  # return a Hash of all key => value pairs defined in .powenv
  def powenv(pow_app)
    powenv_path = "#{@pow_path}/#{pow_app}/.powenv"
    powenv = File.open(powenv_path).readlines if File.exists?(powenv_path)

    hash = {}
    powenv.each do |line|
      hash[$1.strip.to_sym] = $2.strip if line =~ /\s?export\s?(.+)=(.+)/i
    end unless powenv.nil?

    return hash.empty? ? nil : hash
  end

  def rvmrc(pow_app)
    rvmrc_path = "#{@pow_path}/#{pow_app}/.rvmrc"
    rvmrc = File.open(rvmrc_path).readlines.join("\n") if File.exists?(rvmrc_path)

    hash = {}
    if rvmrc =~ /environment_id="(.+)"/i
      hash[:ruby] = $1
    elsif rvmrc =~ /rvm\ ?(.+)/i
      hash[:ruby] = $1
    end

    return hash.empty? ? nil : hash
  end

  def powrc(pow_app)
    powrc_path = "#{@pow_path}/#{pow_app}/.powrc"
    powrc = File.open(powrc_path).readlines if File.exists?(powrc_path)

    hash = {}
    powrc.each do |line|
      hash[$1.strip.to_sym] = $2.strip if line =~ /\s?export\s?(.+)=(.+)/i
    end unless powrc.nil?

    return hash.empty? ? nil : hash
  end
end