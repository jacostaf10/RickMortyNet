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
    public let image: String
    public let episode: [String]
    public let url: String
    
    public init(id: Int, name: String, status: Status, species: String, type: String, gender: Gender, origin: Character.Location, location: Character.Location, image: String, episode: [String], url: String) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.status = try container.decode(Character.Status.self, forKey: .status)
        self.species = try container.decode(String.self, forKey: .species)
        self.type = try container.decode(String.self, forKey: .type)
        self.gender = try container.decode(Character.Gender.self, forKey: .gender)
        self.origin = try container.decode(Character.Location.self, forKey: .origin)
        self.location = try container.decode(Character.Location.self, forKey: .location)
        self.image = try container.decode(String.self, forKey: .image)
        self.episode = try container.decode([String].self, forKey: .episode)
        self.url = try container.decode(String.self, forKey: .url)
    }
    
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
        public let name: String
        public let url: String
        
        public init(name: String, url: String) {
            self.name = name
            self.url = url
        }
        
        public init(from decoder: any Decoder) throws {
            let container: KeyedDecodingContainer<Character.Location.CodingKeys> = try decoder.container(keyedBy: Character.Location.CodingKeys.self)
            self.name = try container.decode(String.self, forKey: Character.Location.CodingKeys.name)
            self.url = try container.decode(String.self, forKey: Character.Location.CodingKeys.url)
        }
    }
}

public struct Location: Codable, Identifiable, RawQueryable {
    public let id: Int
    public let name: String
    public let type: String
    public let dimension: String
    public let residents: [String]
    public let url: String
    
    public init(id: Int, name: String, type: String, dimension: String, residents: [String], url: String) {
        self.id = id
        self.name = name
        self.type = type
        self.dimension = dimension
        self.residents = residents
        self.url = url
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(String.self, forKey: .type)
        self.dimension = try container.decode(String.self, forKey: .dimension)
        self.residents = try container.decode([String].self, forKey: .residents)
        self.url = try container.decode(String.self, forKey: .url)
    }
    
    public static let associatedURL: URL = .locations
}

public struct Episode: Codable, Identifiable, RawQueryable {
    public let id: Int
    public let name: String
    public let airDate: String
    public let episode: String
    public let characters: [String]
    public let url: String
    
    public init(id: Int, name: String, airDate: String, episode: String, characters: [String], url: String) {
        self.id = id
        self.name = name
        self.airDate = airDate
        self.episode = episode
        self.characters = characters
        self.url = url
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.airDate = try container.decode(String.self, forKey: .airDate)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.episode = try container.decode(String.self, forKey: .episode)
        self.characters = try container.decode([String].self, forKey: .characters)
        self.url = try container.decode(String.self, forKey: .url)
    }
    
    public static let associatedURL: URL = .episodes
    
    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case id, name, episode, characters, url
    }
}

public struct ResponseInfo: Codable, Sendable {
    public let count: Int
    public let pages: Int
    public let next: String?
    public let prev: String?
    
    public init(count: Int, pages: Int, next: String?, prev: String?) {
        self.count = count
        self.pages = pages
        self.next = next
        self.prev = prev
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.count = try container.decode(Int.self, forKey: .count)
        self.pages = try container.decode(Int.self, forKey: .pages)
        self.next = try container.decodeIfPresent(String.self, forKey: .next)
        self.prev = try container.decodeIfPresent(String.self, forKey: .prev)
    }
}

public struct CharacterResponse: Queryable {
    public let info: ResponseInfo
    public let results: [Character]
    
    public init(info: ResponseInfo, results: [Character]) {
        self.info = info
        self.results = results
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.info = try container.decode(ResponseInfo.self, forKey: .info)
        self.results = try container.decode([Character].self, forKey: .results)
    }
    
    enum CodingKeys: String, CodingKey {
        case info, results
    }
    
    static public let associatedURL: URL = .characters
}

public struct LocationResponse: Queryable {
    public let info: ResponseInfo
    public let results: [Location]
    
    public init(info: ResponseInfo, results: [Location]) {
        self.info = info
        self.results = results
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.info = try container.decode(ResponseInfo.self, forKey: .info)
        self.results = try container.decode([Location].self, forKey: .results)
    }
    
    enum CodingKeys: String, CodingKey {
        case info, results
    }
    
    static public let associatedURL: URL = .locations
}

public struct EpisodeResponse: Queryable {
    public let info: ResponseInfo
    public let results: [Episode]
    
    public init(info: ResponseInfo, results: [Episode]) {
        self.info = info
        self.results = results
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.info = try container.decode(ResponseInfo.self, forKey: .info)
        self.results = try container.decode([Episode].self, forKey: .results)
    }
    
    enum CodingKeys: String, CodingKey {
        case info, results
    }
    
    static public let associatedURL: URL = .episodes
}

