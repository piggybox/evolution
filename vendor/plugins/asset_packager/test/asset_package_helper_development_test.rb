$:.unshift(File.dirname(__FILE__) + '/../lib')

ENV['RAILS_ENV'] = "development"
require File.dirname(__FILE__) + '/../../../../config/environment'
require 'test/unit'
require 'rubygems'

require 'action_controller/test_process'

ActionController::Base.logger = nil
ActionController::Base.ignore_missing_templates = false
ActionController::Routing::Routes.reload rescue nil

$asset_packages_yml = YAML.load_file("#{RAILS_ROOT}/vendor/plugins/asset_packager/test/asset_packages.yml")
$asset_base_path = "#{RAILS_ROOT}/vendor/plugins/asset_packager/test/assets"

class AssetPackageHelperProductionTest < Test::Unit::TestCase
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::AssetTagHelper
  include Synthesis::AssetPackageHelper

  def setup
    @controller = Class.new do
      #def url_for(options, *parameters_for_method_reference)
      #  url =  "http://www.example.com/"
      #  url << options[:action].to_s if options and options[:action]
      #  url
      #end
      attr_reader :request
      def initialize
        @request = Class.new do
          def relative_url_root
            ""
          end
        end.new
      end

    end.new
  end
  
  def build_js_expected_string(*sources)
    sources.map {|s| %(<script src="/javascripts/#{s}.js" type="text/javascript"></script>) }.join("\n")
  end
    
  def build_css_expected_string(*sources)
    sources.map {|s| %(<link href="/stylesheets/#{s}.css" rel="Stylesheet" type="text/css" media="screen" />) }.join("\n")
  end
    
  def test_js_basic
    assert_dom_equal build_js_expected_string("prototype"),
      javascript_include_merged("prototype")
  end

  def test_js_multiple_packages
    assert_dom_equal build_js_expected_string("prototype", "foo"), 
      javascript_include_merged("prototype", "foo")
  end
  
  def test_js_unpackaged_file
    assert_dom_equal build_js_expected_string("prototype", "foo", "not_part_of_a_package"), 
      javascript_include_merged("prototype", "foo", "not_part_of_a_package")
  end
  
  def test_js_multiple_from_same_package
    assert_dom_equal build_js_expected_string("prototype", "effects", "controls", "not_part_of_a_package", "foo"), 
      javascript_include_merged("prototype", "effects", "controls", "not_part_of_a_package", "foo")
  end

  def test_css_basic
    assert_dom_equal build_css_expected_string("screen"),
      stylesheet_link_merged("screen")
  end

  def test_css_multiple_packages
    assert_dom_equal build_css_expected_string("screen", "foo"), 
      stylesheet_link_merged("screen", "foo")
  end
  
  def test_css_unpackaged_file
    assert_dom_equal build_css_expected_string("screen", "foo", "not_part_of_a_package"), 
      stylesheet_link_merged("screen", "foo", "not_part_of_a_package")
  end
  
  def test_css_multiple_from_same_package
    assert_dom_equal build_css_expected_string("screen", "header", "not_part_of_a_package", "foo", "bar"), 
      stylesheet_link_merged("screen", "header", "not_part_of_a_package", "foo", "bar")
  end
  
end