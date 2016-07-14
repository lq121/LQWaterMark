
Pod::Spec.new do |s|
  s.name         = "LQWaterMark"
  s.version      = "0.0.1"
  s.summary      = "use sdwebImage get a waterMark image"
  s.homepage     = "https://github.com/lq121/LQWaterMark"
  s.license      = "MIT"
  s.author             = { "lq121" => "1210971329@qq.com" }
  s.social_media_url   = "https://github.com/lq121"
  s.source       = { :git => "https://github.com/lq121/LQWaterMark.git", :tag =>  s.version }
  s.source_files  = "LQWaterMark"
  s.requires_arc = true
end
