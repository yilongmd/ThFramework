Pod::Spec.new do |s|
  s.name         = "ThFrameworkPods"
  s.version      = "1.0.1"
  s.summary      = "a common framework for the team."

  s.homepage     = "https://github.com/yilongmd/ThFramework.git"
  s.license      = 'MIT'
  s.author       = { "yilongmd" => "317616660@qq.com" }
  s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/yilongmd/ThFramework.git", :tag => "1.0.1"}
  s.source_files  = 'ThFrameworkPods/framework/*.{h,m}'
  s.requires_arc = true
  s.dependency "SSToolkit", "~> 2.0.0"
  s.dependency "JSONModel", "~> 1.2.0"
  s.dependency "KVOController", "~> 1.1.0"
  s.dependency "ReactiveCocoa", "~> 2.5"
  s.dependency "FMDB", "~> 2.6.2"
  s.dependency "YTKNetwork", "~> 0.6.0"
  s.dependency "Toast", "~> 3.0"
  s.dependency "MBProgressHUD", "~> 0.9.2"


end




