# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

def common
  pod 'SwiftLint'
  pod 'RxSwift', '~> 5'
  pod 'OrderedSet'
  pod 'Alamofire'
end

def application
  pod 'RxCocoa', '~> 5'
  pod 'NSObject+Rx'
  pod 'Reusable'
  pod 'Swinject'
  pod 'MBProgressHUD'
end

target 'ClearArchitecture' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ClearArchitecture
  common
  application

  target 'ClearArchitectureTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ClearArchitectureUITests' do
    # Pods for testing
  end

end
