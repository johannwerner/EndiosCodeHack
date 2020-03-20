//
//  ContentView.swift
//  RickAndMortySwiftUI
//
//  Created by Johann Werner on 07.03.20.
//  Copyright © 2020 Johann Werner. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var results = [CharacterModel]()
    var body: some View {
        NavigationView {
            List(results) { item in
                NavigationLink(destination: DetailView(character: item)) {
                    HStack(alignment: .top) {
                        RMImage(item.image!)
                            .resizable()
                            .frame(width:50, height: 50)
                        VStack(alignment: .leading) {
                            Text(item.name).font(.headline)
                            Text(item.species)
                        }
                    }
                }
            }.onAppear(perform: loadData)
                .navigationBarTitle("Characters")
        }
    }
    
    func loadData() {
        NetworkLayer().get(endpointUrl: "https://rickandmortyapi.com/api/character/") { data in
            let decoder = JSONDecoder()
            let strategy = JSONDecoder.KeyDecodingStrategy.useDefaultKeys
            decoder.keyDecodingStrategy = strategy
            do {
                let response = try decoder.decode(Response.self, from: data)
                self.results = response.results
            } catch {
                debugPrint(error)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
