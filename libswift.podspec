#
# Be sure to run `pod lib lint libswift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'libswift'
  s.version          = '0.6.0'
  s.summary          = 'Library for Swift Language'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A short description of libswift.
                       DESC

  s.homepage         = 'https://github.com/src256/libswift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'src' => 'src@srcw.net' }
  s.source           = { :git => 'https://github.com/src256/libswift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.ios.deployment_target = '15.0'
  s.source_files = 'libswift/Classes/**/*'
  #  s.resources = 'libswift/Classes**/*.xib'
  
  s.resource_bundles = {
    'libswift' => ['libswift/Classes/*.xib']
  }
  
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
