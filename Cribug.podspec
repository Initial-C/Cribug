
Pod::Spec.new do |s|
  s.name             = 'Cribug'
  s.version          = '0.0.1'
  s.swift_version = '4.0'
  s.summary          = 'Cribug is a lightweight, pure-Swift download framework.'


  s.homepage         = 'https://github.com/Initial-C/Cribug'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'InitialC' => 'iwilliamchang@outlook.com' }
  s.source           = { :git => 'https://github.com/Initial-C/Cribug.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Cribug/*.swift'
  s.requires_arc = true
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }

end
