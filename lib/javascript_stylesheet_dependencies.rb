require 'yaml'

module JavascriptStylesheetDependencies
  def javascript_dependencies
    javascripts = Dir[Rails.root.join('public', 'javascripts', '**', '*.js')].reject {|a| a =~ /^.*\/tiny_mce\// }.collect {|a| a.gsub(/^.*\/public\/javascripts\/(.*)\.js$/, '\1') }
    YAML.load_file(Rails.root.join('config', 'javascripts.yml')).collect do |a|
      javascripts.detect { |b| b =~ /#{a}\.js$/ }
    end.concat(javascripts).compact.uniq
  end

  def stylesheet_dependencies
    stylesheets = Dir[Rails.root.join('public', 'stylesheets', '**', '*.css')].collect {|a| a.gsub(/^.*\/public\/stylesheets\/(.*)\.css$/, '\1') }
    YAML.load_file(Rails.root.join('config', 'stylesheets.yml')).collect do |a|
      stylesheets.detect { |b| b =~ /#{a}\.css$/ }
    end.concat(stylesheets).compact.uniq
  end  
end