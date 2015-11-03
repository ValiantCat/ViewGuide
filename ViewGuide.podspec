Pod::Spec.new do |s|
  s.name             = "ViewGuide"
  s.version          = "1.0.0"
  s.summary          = "ViewGuide"
  s.description      = <<-DESC
                      辅助查看View的 宽高属性 再也不担心设计师找我1像素的梗了  by Objective-C. 
                       DESC
  s.homepage         = "https://github.com/aiqiuqiu/ViewGuide"
  # s.screenshots      = "https://github.com/aiqiuqiu/ViewGuide/blob/master/Demo1.gif", "https://github.com/aiqiuqiu/ViewGuide/blob/master/Demo2.png" , "https://github.com/aiqiuqiu/ViewGuide/blob/master/Demo3.png"
  s.license          = 'MIT' 
  s.author           = { "寒哥" => "519224747@qq.com" }
  s.source           = { :git => "https://github.com/aiqiuqiu/ViewGuide.git", :tag => s.version.to_s } 
  # s.social_media_url = 'https://twitter.com/NAME'

  s.platform     = :ios, '7.0'
  # s.ios.deployment_target = '9.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'ViewGuide/*'
  # s.resources = 'Assets'
  s.license      = "MIT"
  # s.ios.exclude_files = 'Classes/osx'
  # s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'end
