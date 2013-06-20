Pod::Spec.new do |s|
  s.name         = "MHListPicker"
  s.version      = "0.0.1"
  s.summary      = "A simple table based list picker."
  s.homepage     = "http://github.com/gmarik/MHListPicker"

  s.license      = {:type => 'MIT', :file => 'LICENSE.txt'}

  s.author       = { "gmarik" => "gmarik@gmail.com" }

  s.source       = { :git => "https://github.com/gmarik/MHListPicker.git", :tag => "v#{s.version}" }

  s.platform     = :ios, '5.0'

  s.source_files = '**/*.{h,m}'
  s.exclude_files = 'Classes/Exclude'

  s.requires_arc = true

end
