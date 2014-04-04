require 'minitest/autorun'
require_relative '../fundamentus_fetcher.rb'
require_relative '../fundamentus_parser.rb'
require_relative '../file_manager.rb'
require_relative '../local_file_fetcher.rb'

TEST_DIR = File.expand_path('.', File.dirname(__FILE__)) + '/'
