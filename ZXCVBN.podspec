Pod::Spec.new do |s|

  s.name         = "ZXCVBN"
  s.version      = "1.0.4"
  s.summary      = "ZXCVBN password strength estimation"
  s.homepage     = "https://tech.dropbox.com/2012/04/zxcvbn-realistic-password-strength-estimation/"
  s.license      = { :type => "MIT" }
  s.author       = { "John Johnson" => "wangsw.a@gmail.com" }
  s.source       = { :git => "https://github.com/gabriel/ZXCVBN.git", :tag => s.version.to_s }
  s.source_files = "ZXCVBN/**/*.{c,h,m}"
  s.resources    = "tools/generated/*.json"
  s.requires_arc = true

  s.ios.platform = :ios, "7.0"
  s.ios.deployment_target = "7.0"

  s.osx.platform = :osx, "10.8"
  s.osx.deployment_target = "10.8"
end
