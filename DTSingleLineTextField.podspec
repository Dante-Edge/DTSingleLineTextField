Pod::Spec.new do |s|
  s.name         = "DTSingleLineTextField"
  s.version      = "0.0.1"
  s.summary      = "Simple text field with custom border at bottom and sides"
  s.description  = <<-DESC
		# DTSingleLineTextField

		Simple text field with custom border at bottom and sides.

		Features:

		* bottom line border
		* optional bottom line endpoint
		* support storyboard
                   DESC

  s.homepage     = "https://github.com/Dante-Edge/DTSingleLineTextField"
  s.license      = "MIT"
  s.author             = { "Dante" => "elvewyn@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/Dante-Edge/DTSingleLineTextField.git", :tag => "0.0.1" }
  s.source_files  = "DTSingleLineTextField", "DTSingleLineTextField/**/*.{h,m,swift}"
  s.exclude_files = "Classes/Exclude"
  s.frameworks = "UIKit"
end
