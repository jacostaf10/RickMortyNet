//
//  Models.swift
//  RickMortyNet
//
//  Created by Jorge Acosta Freire on 13/9/24.
//

import Foundation

public struct Character: Codable, Identifiable, RawQueryable {
    public let id: Int
    public let name: String
    public let status: Status
    public let species: String
    public let type: String
    public let gender: Gender
    public let origin: Location
    public let location: Location
    public let image: URL
    public let episode: [URL]
    public let url: URL
    public let created: Date
    
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
    public let name: String
    public let type: String
    public let dimension: String
    public let residents: [URL]
    public let url: URL
    public let created: Date
    
    public static let associatedURL: URL = .locations
}

public struct Episode: Codable, Identifiable, RawQueryable {
    public let id: Int
    public let name: String
    public let airDate: Date
    public let episode: Int
    public let characters: [URL]
    public let url: URL
    public let created: Date
    
    public static let associatedURL: URL = .episodes
    
    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case id, name, episode, characters, url, created
    }
}

public struct ResponseInfo: Codable, Sendable {
    public let count: Int
    public let pages: Int
    public let next: URL?
    public let prev: URL?
}

public struct CharacterResponse: Queryable {
    public let info: ResponseInfo
    public let results: [Character]
    
    enum CodingKeys: String, CodingKey {
        case info, results
    }
    
    static public let associatedURL: URL = .characters
}

public struct LocationResponse: Queryable {
    public let info: ResponseInfo
    public let results: [Location]
    
    enum CodingKeys: String, CodingKey {
        case info, results
    }
    
    static public let associatedURL: URL = .locations
}

public struct EpisodeResponse: Queryable {
    public let info: ResponseInfo
    public let results: [Episode]
    
    enum CodingKeys: String, CodingKey {
        case info, results
    }
    
    static public let associatedURL: URL = .episodes
}

