#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint apple_pencil_double_tap.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'apple_pencil_double_tap'
  s.version          = '0.0.1'
  s.summary          = 'Flutter plugin to detect apple pencil double tap.'
  s.description      = <<-DESC
Simple flutter plugin project to get information when user double tapped on their apple pencil.
                       DESC
  s.homepage         = 'https://codegrowers.tech'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Code Growers s.r.o.' => 'adam.kvasnicka@codegrowers.tech' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.1'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
