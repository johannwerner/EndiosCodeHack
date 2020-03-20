//
//  NetworkLayer.swift
//  RickAndMortySwiftUI
//
//  Created by Johann Werner on 07.03.20.
//  Copyright © 2020 Johann Werner. All rights reserved.
//

import UIKit

typealias ServiceCompletion = (Data) -> Void
typealias JSON = [String: Any]
typealias FlowCompletion = (_ result: AnyObject?, _ error: Error?) -> Void

struct NetworkLayer {
    
    var headers  = [String: String]()
    
    static let sharedInstance = NetworkLayer()
    init() {
        #if DEBUG
        let sharedCache = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
        URLCache.shared = sharedCache
        #endif
    }
    
    func get(endpointUrl: String, completion: @escaping ServiceCompletion) {
        guard let url = URL(string: endpointUrl) else {
            assertionFailure("Not valid url")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            DispatchQueue.main.async {
                 completion(data)
             }
            
        }.resume()
    }
    
}
