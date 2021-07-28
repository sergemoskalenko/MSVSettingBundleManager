#
# Be sure to run `pod lib lint MSVSettingBundleManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MSVSettingBundleManager'
  s.version          = '0.1.2'
  s.summary          = 'MSVSettingBundleManager makes it easy to read / set settings in the Settings Bundle engine and handle event settings changes.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/sergemoskalenko/MSVSettingBundleManager'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Serge Moskalenko' => 'https://github.com/sergemoskalenko' }
  s.source           = { :git => 'https://github.com/sergemoskalenko/MSVSettingBundleManager.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/sergemoskalenko'

  s.ios.deployment_target = '9.3'

  s.source_files = 'MSVSettingBundleManager/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MSVSettingBundleManager' => ['MSVSettingBundleManager/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
