//
//  Models.swift
//  RickMortyNet
//
//  Created by Jorge Acosta Freire on 13/9/24.
//

import Foundation

public struct Character: Codable, Identifiable, RawQueryable {
    public let id: Int
    let name: String
    let status: Status
    let species: String
    let type: String
    let gender: Gender
    let origin: Location
    let location: Location
    let image: URL
    let episode: [URL]
    let url: URL
    let created: Date
    
    public static let associatedURL: URL = .characters
    
    public enum Status: String, Codable, Sendable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "unknown"
    }
    
    public enum Gender: String, Codable, Sendable {
        case male = "Male"
        case female = "Female"
        case genderless = "Genderless"
        case unknown = "unknown"
    }
    
    public struct Location: Codable, Sendable {
        let name: String
        let url: URL
    }
}

public struct Location: Codable, Identifiable, RawQueryable {
    public let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [URL]
    let url: URL
    let created: Date
    
    public static let associatedURL: URL = .locations
}

public struct Episode: Codable, Identifiable, RawQueryable {
    public let id: Int
    let name: String
    let airDate: Date
    let episode: Int
    let characters: [URL]
    let url: URL
    let created: Date
    
    public static let associatedURL: URL = .episodes
    
    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case id, name, episode, characters, url, created
    }
}

public struct ResponseInfo: Codable, Sendable {
    let count: Int
    let pages: Int
    let next: URL?
    let previous: URL?
}

public struct CharacterResponse: Queryable {
    let info: ResponseInfo
    let results: [Character]
    
    static public let associatedURL: URL = .characters
}

public struct LocationResponse: Queryable {
    let info: ResponseInfo
    let results: [Location]
    
    static public let associatedURL: URL = .locations
}

public struct EpisodeResponse: Queryable {
    let info: ResponseInfo
    let results: [Episode]
    
    static public let associatedURL: URL = .episodes
}

