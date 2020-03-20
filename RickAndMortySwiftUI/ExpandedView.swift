import SwiftUI

final class ExpandedView: View {
    var url: String
    @State var characters = [String]()
    
    var body: some View {
        List(characters, id: \.self) {
            Text($0)
        }
    }
    
    init(url: String) {
        self.url = url
    }
    
    func loadData() {
        NetworkLayer().get(endpointUrl: url) { data in
            let decoder = JSONDecoder()
            let strategy = JSONDecoder.KeyDecodingStrategy.useDefaultKeys
            decoder.keyDecodingStrategy = strategy
            do {
                let episode = try decoder.decode(Episode.self, from: data)
                self.characters = episode.characters
            } catch {
                debugPrint(error)
            }
        }
    }
}

#if DEBUG
struct ExpandedPreview: PreviewProvider {
    static var previews: some View {
        ExpandedView(url: "https://rickandmortyapi.com/api/episode/28")
    }
}
#endif
