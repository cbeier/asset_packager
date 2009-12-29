require 'yaml'
require File.expand_path(File.join(File.dirname(__FILE__), '..' , 'lib', 'javascript_stylesheet_dependencies'))
require File.dirname(__FILE__) + '/../lib/synthesis/asset_package'

namespace :asset do
  namespace :packager do

    desc "Merge and compress assets"
    task :build_all do
      Synthesis::AssetPackage.build_all
    end

    desc "Delete all asset builds"
    task :delete_all do
      Synthesis::AssetPackage.delete_all
    end
    
    desc "Generate asset_packages.yml from existing assets"
    task :create_yml do
      Synthesis::AssetPackage.create_yml
    end
    
  end
end
