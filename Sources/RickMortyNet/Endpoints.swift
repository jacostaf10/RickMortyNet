//
//  Endpoints.swift
//  RickMortyNet
//
//  Created by Jorge Acosta Freire on 13/9/24.
//

import Foundation

public extension URL {
    static let base = URL(string: "https://rickandmortyapi.com/api/")!
    
    static let characters = base.appendingPathComponent("character")
    static let locations = base.appendingPathComponent("location")
    static let episodes = base.appendingPathComponent("episode")
}
