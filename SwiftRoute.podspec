
Pod::Spec.new do |s|
  s.name             = 'SwiftRoute'
  s.version          = '0.0.1'
  s.summary          = 'A short description of SwiftRoute.'
  
  s.description      = <<-DESC
  TODO: Add long description of the pod here.
  DESC
  
  s.homepage         = 'https://github.com/jackiehu/SwiftRoute'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jackiehu' => '814030966@qq.com' }
  s.source           = { :git => 'https://github.com/jackiehu/SwiftRoute.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = "11.0"
  s.swift_versions     = ['5.5','5.4','5.3','5.2','5.1','5.0']
  s.requires_arc = true
  s.frameworks   = "UIKit", "Foundation"
  
  s.subspec 'Protocol' do |ss|
    ss.dependency 'SwiftRoute/Tools'
    ss.source_files = 'Sources/SwiftRoute/Protocol/**/*'
  end
  
  s.subspec 'Tools' do |ss|
    ss.source_files = 'Sources/SwiftRoute/Tools/**/*'
  end
  
  s.subspec 'Delegate' do |ss|
    ss.source_files = 'Sources/SwiftRoute/Delegate/**/*'
  end
end
