#source 'http://ruby.taobao.org'
source 'https://rubygems.org'

ruby '2.1.1'

gem 'rails', '4.1.0.rc1'
gem 'sass-rails', '~> 4.0.1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'foundation-rails'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'qiniu'
gem 'viddl-rb'
gem 'video_info',git: 'git@github.com:apprentice1988/video_info.git'
gem 'pg'
gem 'rails-i18n'
gem 'simple_form'

group :development do
  gem "better_errors"
  #gem 'rack-mini-profiler'
  gem 'binding_of_caller'
  gem 'spring'
end

group :test do
  gem 'factory_girl_rails'
  gem "rspec-rails"
end

gem 'rails_12factor',group: :production

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]




#=======================================================
#Video_info
#video = VideoInfo.new("http://www.youtube.com/watch?v=mZqGqE0D0n4")

#=====================================================
#ViddlRb
#Download a video: viddl-rb http://www.youtube.com/watch?v=QH2-TGUlwu4
####-e, --extract-audio              Save video audio to file
####-a, --abort-on-failure           Abort download queue if one of the videos fail to download
####-u, --url-only                   Prints url without downloading
####-t, --title-only                 Prints title without downloading
####-f, --filter REGEX               Filters a video playlist according to the regex (Youtube only right now)
####-s, --save-dir DIRECTORY         Specifies the directory where videos should be saved
####-d, --downloader TOOL            Specifies the tool to download with. Supports 'wget', 'curl' and 'net-http'
####-q, --quality QUALITY            Specifies the video format and resolution in the following way: width:height:res (e.g. 1280:720:mp4)
                                 ####The width, height and resolution may be omitted with a *.
                                 ####For example, to match any quality with a height of 720 pixels in any format specify --quality *:720:*
####-h, --help                       Displays the help screen

#require 'viddl-rb'
#download_urls = ViddlRb.get_urls("http://www.youtube.com/watch?v=QH2-TGUlwu4")
#download_urls.first     # => "http://o-o.preferred.arn06s04.v3.lscac ..."

#get_urls_names(url) -- Returns an array of one or more hashes that has the keys :url which points to the download url and :name which points to the name (which is a filename safe version of the video title with a file extension). Returns nil if the url is not recognized by any plugins.
#
#get_urls_exts(url) -- Same as get_urls_names but with just the file extension (for example ".mp4") instead of the full filename, and the :name key is replaced with :ext. Returns nil if the url is not recognized by any plugins.
#
#get_urls(url) -- Returns an array of download urls for the specified video url. Returns nil if the url is not recognized by any plugins.
#
#get_names(url) -- Returns an array of filenames for the specified video url. Returns nil if the url is not recognized by any plugins.
#
#io=(io_object) -- By default all plugin output to stdout will be suppressed when the library is used. If you are interested in the output of a plugin, you can set an IO object that will receive all plugin output using this method

#=======================================================================================
