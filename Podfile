platform :ios, '13.0'
inhibit_all_warnings!
use_frameworks!
source 'https://github.com/CocoaPods/Specs.git'
ENV['COCOAPODS_DISABLE_STATS'] = 'true'

# Workspace and project definition
workspace 'RickAndMortySwiftUISwiftUI'
project 'RickAndMortySwiftUI.xcodeproj'

def shared_pods
    # Network layer abstraction
    pod 'Kingfisher/SwiftUI'
end


target 'RickAndMortySwiftUI' do
    project 'RickAndMortySwiftUI.xcodeproj'

    shared_pods
    target 'RickAndMortySwiftUITests' do
      inherit! :search_paths
    end
    
end
