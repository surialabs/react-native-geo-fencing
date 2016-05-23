Pod::Spec.new do |s|
  s.name         = "react-native-geo-fencing"
  s.author       = { "Chin Loong Tan" => "chinloong.tan@surialabs.com" }

  s.version      = "0.1.0"
  s.summary      = "Native modules to determine if a location is within defined geographical boundaries using Google Geometry library"
  s.license      = "MIT"

  s.homepage     = "https://github.com/surialabs/react-native-geo-fencing"
  s.source       = { git: "https://github.com/surialabs/react-native-geo-fencing.git", :tag => "#{s.version}" }

  s.requires_arc = true
  s.source_files  = "ios/*"
  s.platform     = :ios, "7.0"

  s.dependency "GoogleMaps"
  s.dependency "React"
end
