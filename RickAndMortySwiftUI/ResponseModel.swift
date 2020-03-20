//
//  ResponseModel.swift
//  RickAndMortySwiftUI
//
//  Created by Johann Werner on 08.03.20.
//  Copyright © 2020 Johann Werner. All rights reserved.
//

import Foundation

struct Response: Codable {
    var results: [CharacterModel]
}

struct Result: Codable, Identifiable {
    var id: Int {
        return trackId
    }
    
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct typeID:Hashable {
    var someInt: Int
}

import Foundation

struct CharacterModel: Codable, Identifiable {
    var image: URL?
    var id: Int
    var name: String
    var species: String
    var origin: Location
    var gender: String
    var status: String
    var location: Location
    var episode: [String]
    
    var imageUrlToShow: URL? {
        image
    }
    
//    enum CodingKeys: String, CodingKey {
//        case image
//        case id
//        case name
//        case species
//        case origin
//        case gender
//        case status
//        case location
//        case episode
//    }
    
    // MARK: - Life Cycle
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let image = try container.decode(URL.self, forKey: .image)
//        let id = try container.decode(Int.self, forKey: .id)
//        let name = try container.decode(String.self, forKey: .name)
//        let species = try container.decode(String.self, forKey: .species)
//        let origin = try container.decode(Location.self, forKey: .origin)
//        let gender = try container.decode(String.self, forKey: .gender)
//        let status = try container.decode(String.self, forKey: .status)
//        let lastKnownLocation = try container.decode(Location.self, forKey: .location)
//        let episode = try container.decode([URL].self, forKey: .episode)
//
//        self.image = image
//        self.id = id
//        self.name = name
//        self.isFavorite = false
//        self.species = species
//        self.origin = origin
//        self.gender = gender
//        self.status = status
//        self.location = lastKnownLocation
//        self.episode = episode
//
//    }
    
    struct Location: Codable {
        var name: String
        var url: String
    }
}

struct Episode: Codable, Identifiable {
    var id: Int
    var name: String
    var air_date: String
    var episode: String
    var characters: [String]
    var url: String
    var created: String
}
