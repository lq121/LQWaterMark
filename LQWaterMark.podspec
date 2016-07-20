
Pod::Spec.new do |s|
  s.name         = "LQWaterMark"
  s.version      = "0.0.3"
  s.summary      = "use sdwebImage get a waterMark image"
  s.homepage     = "https://github.com/lq121/LQWaterMark"
  s.license      = "MIT"
  s.author             = { "魑魅魍魉121" => "1210971329@qq.com" }
  s.social_media_url   = "https://github.com/lq121"
  s.platform     = :ios, "5.0"
s.source       = { :git => "https://github.com/lq121/LQWaterMark.git", :tag =>"0.0.3", :commit => "db57bcfba795c2d78ced0141d2e282b490f84bfd" }
  s.source_files  = "LQWaterMark/**/*.{h,m}"
  s.requires_arc = true
  s.dependency 'SDWebImage', '~> 3.8.1'
end
