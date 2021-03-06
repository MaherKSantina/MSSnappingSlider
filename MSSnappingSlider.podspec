#
# Be sure to run `pod lib lint MSSnappingSlider.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MSSnappingSlider'
  s.version          = '0.1.0'
  s.summary          = 'Subclass of UISlider which snaps to specific values based on the step value provided.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
MSSnappingSlider is a subclass of `UISlider` that will give you access to 2 attributes, `step` and `threshold` where you can define exactly how the snapping should work.
                       DESC

  s.homepage         = 'https://github.com/MaherKSantina/MSSnappingSlider'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'MaherKSantina' => 'maher.santina90@gmail.com' }
  s.source           = { :git => 'https://github.com/MaherKSantina/MSSnappingSlider.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MSSnappingSlider/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MSSnappingSlider' => ['MSSnappingSlider/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
