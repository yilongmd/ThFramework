Pod::Spec.new do |s|
  s.name         = "ThFrameworkPods"
  s.version      = "0.0.3"
  s.summary      = "a common framework for the team."

  s.homepage     = "https://github.com/yilongmd/ThFramework.git"
  s.license      = 'MIT'
  s.author       = { "yilongmd" => "317616660@qq.com" }
  s.platform     = :ios, "7.0"
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/yilongmd/ThFramework.git", :tag => "0.0.3"}
  s.source_files  = 'ThFrameworkPods/framework/*.{h,m}'
  s.requires_arc = true
end




