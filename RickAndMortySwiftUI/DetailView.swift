import SwiftUI

struct DetailView: View {
    var character: CharacterModel
    @State var isExpanded = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            RMImage(character.image!)
                .aspectRatio(1, contentMode: .fit)
            VStack(alignment: .leading, spacing: 8) {
                if isExpanded {
                    ExpandedView(url: "") // ???????
                } else {
                    ForEach(character.episode, id: \.self) {
                        Text("\($0)")
                            .underline()
                            .frame(minHeight: 40)
                            .foregroundColor(.blue)
                            .onTapGesture {
                                self.isExpanded = true
                        }
                    }
                }
            }.animation(.easeInOut)
        }
        .navigationBarTitle(Text(character.name), displayMode: .large)
    }
}

#if DEBUG
struct DetailPreview: PreviewProvider {
    static var previews: some View {
        DetailView(character: CharacterModel(image: URL(string: "https://rickandmortyapi.com/api/character/avatar/10.jpeg")!, id: 0, name: "Name", species: "", origin: .init(name: "", url: ""), gender: "", status: "", location: .init(name: "", url: ""), episode: []))
    }
}
#endif
