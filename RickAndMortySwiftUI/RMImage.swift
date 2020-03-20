//
//  ImageFromUrl.swift
//  RickAndMortySwiftUI
//
//  Created by Johann Werner on 08.03.20.
//  Copyright © 2020 Johann Werner. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct RMImage: View {
    var url: URL
    var configurations: [(SwiftUI.Image) -> SwiftUI.Image]
 
    init(_ url: URL) {
        configurations = []
        self.url = url
    }
    var body: some View {
        KFImage(url).resizable()
    }
    
    func resizable(
        capInsets: EdgeInsets = EdgeInsets(),
        resizingMode: SwiftUI.Image.ResizingMode = .stretch) -> RMImage
    {
        configure { $0.resizable(capInsets: capInsets, resizingMode: resizingMode) }
    }
    
    private func configure(_ block: @escaping (SwiftUI.Image) -> SwiftUI.Image) -> RMImage {
        var result = self
        result.configurations.append(block)
        return result
    }

}

struct ImageFromUrl_Previews: PreviewProvider {
    static var previews: some View {
        RMImage(URL(string: "https://rickandmortyapi.com/api/character/avatar/10.jpeg")!)
    }
}
