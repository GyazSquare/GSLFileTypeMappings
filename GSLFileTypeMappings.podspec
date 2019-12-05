Pod::Spec.new do |s|
  s.name         = 'GSLFileTypeMappings'
  s.version      = '4.0.0'
  s.author       = 'GyazSquare'
  s.license      = { :type => 'MIT' }
  s.homepage     = 'https://github.com/GyazSquare/GSLFileTypeMappings'
  s.source       = { :git => 'https://github.com/GyazSquare/GSLFileTypeMappings.git', :tag => 'v4.0.0' }
  s.summary      = 'A simple file type mapping library for iOS, macOS, watchOS and tvOS.'
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.6'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
  s.dependency 'GSLSynthesizeSingleton'
  s.requires_arc = true
  s.ios.framework = 'MobileCoreServices'
  s.tvos.framework = 'MobileCoreServices'
  s.watchos.framework = 'MobileCoreServices'
  s.source_files = 'GSLFileTypeMappings/*.{h,m}'
end
