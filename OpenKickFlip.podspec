Pod::Spec.new do |s|
  s.name         = "OpenKickFlip"
  s.version      = "1.5"
  s.summary      = "The OpenKickflip platform provides a complete video broadcasting solution for your iOS 
application. Based on Chris' KickFlip."
  s.homepage     = "https://github.com/pourhadi/OpenKickFlip.git"

  s.license      = 'Apache License, Version 2.0'

  s.author       = { "Gaston Morixe" => "gaston@black.uy", "Chris Ballinger" => "chris@openwatch.net" }
  s.platform     = :ios, '7.0'
  s.source       = { :git => "https://github.com/pourhadi/OpenKickFlip.git", :tag => s.version.to_s }

  s.source_files  = 'OpenKickFlip', 'OpenKickFlip/**/*.{h,m,mm,cpp}'
  s.resources = 'OpenKickFlip/Resources/*'

  s.requires_arc = true

  s.libraries = 'c++'

  s.dependency 'AFNetworking', '~> 2.2'
  s.dependency 'AWSS3', '~> 2.1.1'
  s.dependency 'AFOAuth2Manager', '~> 2.0'
  s.dependency 'CocoaLumberjack', '>= 1.0'
  s.dependency 'SSKeychain', '~> 1.2'
  s.dependency 'FFmpegWrapper', '~> 1.0'
  s.dependency 'PureLayout', '~> 2.0'
  s.dependency 'Mantle', '~> 1.4'
  s.dependency 'SDWebImage', '~> 3.6'
  s.dependency 'FormatterKit/TimeIntervalFormatter', '~> 1.4'
end
