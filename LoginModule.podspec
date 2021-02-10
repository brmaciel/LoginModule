#
# Be sure to run `pod lib lint LoginModule.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LoginModule'
  s.version          = '0.1.0'
  s.summary          = 'LoginModule contains all classes related to Login user case'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  'Long description: modularization of app. It contains all classes needed to perform all actions in Login user case'
                       DESC

  s.homepage         = 'https://github.com/brmaciel/LoginModule'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'brmaciel' => '44143089+brmaciel@users.noreply.github.com' }
  s.source           = { :git => 'https://github.com/brmaciel/LoginModule.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'
  
  s.source_files = 'Source/**/*'
  #s.source_files = 'LoginModule/Classes/**/*'
  
  s.swift_versions = '5.0'
  # s.platforms = {
  #   "ios": "12.0"
  # }
  
  # s.resource_bundles = {
  #   'LoginModule' => ['LoginModule/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
