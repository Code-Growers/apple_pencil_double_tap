#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint apple_pencil_double_tap.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'apple_pencil_double_tap'
  s.version          = '2.0.0'
  s.summary          = 'Apple Pencil double-tap and squeeze events for Flutter.'
  s.description      = <<-DESC
Apple Pencil gesture callbacks on compatible iPads, with iPhone Duo compatibility.
Gesture availability depends on the connected Apple Pencil model.
                       DESC
  s.homepage         = 'https://codegrowers.tech'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Code Growers s.r.o.' => 'adam.kvasnicka@codegrowers.tech' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '15.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.9'
end
