Pod::Spec.new do |s|

  s.name         = "MHFlexibleHeader"
  s.version      = "0.0.1"
  s.summary      = "Flexible Section Header for Tableview"
  s.homepage     = "https://github.com/MickeyHub/MHFlexibleHeader"
  s.screenshots  = "https://raw.githubusercontent.com/MickeyHub/MHFlexibleHeader/master/screenshot.gif"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "MickeySha" => "791331313@qq.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/MickeyHub/MHFlexibleHeader.git", :tag => "0.0.1" }
  s.source_files  = "MHFlexibleHeaderTableView/FlexibleHeaderTableView/*.{h,m}"
  s.requires_arc = true
end
