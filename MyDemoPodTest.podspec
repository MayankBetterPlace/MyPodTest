Pod::Spec.new do |spec|

  spec.name         = "MyDemoPodTest"
  spec.version      = "0.1.7"
  spec.summary      = "A CocoaPods library written in Swift"

  spec.description  = <<-DESC
This CocoaPods library helps you perform calculation.
                   DESC

  spec.homepage     = "https://github.com/MayankBetterPlace/MyPodTest"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "MayankBetterPlace" => "Mayank.sharma2@betterplace.co.in" }
  spec.resources = "MyDemoPodTest/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"


  spec.ios.deployment_target = "13.0"
  spec.swift_version = "4.2"

  spec.source        = { :git => "https://github.com/MayankBetterPlace/MyPodTest.git", :tag => "#{spec.version}" }
  spec.source_files  = "MyDemoPodTest/**/*.{h,m,swift}"

end