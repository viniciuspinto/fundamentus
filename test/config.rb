require 'minitest/autorun'
require_relative '../app/fundamentus/fundamentus_fetcher.rb'
require_relative '../app/fundamentus/fundamentus_parser.rb'
require_relative '../app/util/file_manager.rb'
require_relative '../app/util/local_file_fetcher.rb'

TEST_DIR = File.expand_path('.', File.dirname(__FILE__)) + '/'
