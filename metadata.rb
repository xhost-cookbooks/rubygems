name             "rubygems"
maintainer       "Chris Fordham"
maintainer_email "chris@fordham-nagy.id.au"
license          "Apache 2.0"
description      "Installs/Configures rubygems"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends "ruby"

recipe "rubygems",                "Installs RubyGems"
recipe "rubygems::install_gems",  "Installs a list of RubyGems into system."
recipe "rubygems::update_gems",   "Updates installed RubyGems."

attribute "ruby/install_source",
  :display_name => "Ruby Install Source",
  :description => "The install source for Ruby: none, ruby1.9.1, ruby1.9.3 or package (default: package).",
  :choice => [ "package", "ruby1.9.1", "ruby1.9.3", "none" ],
  :recipes => [ "rubygems", "rubygems::install_gems" ]

 attribute "rubygems/gems_install",
  :display_name => "RubyGems Install",
  :description => "An array or string of RubyGems to install system wide.",
  :type => "array",
  :recipes => [ "rubygems::install_gems" ]
