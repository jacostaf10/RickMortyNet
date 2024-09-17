// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import SwiftNet


public final actor RMNetwork {
    public static let shared = RMNetwork()
    
    public func getCharacter(_ index: Int) async throws -> Character {
        try await getItem(Character.self, index)
    }
    
    public func getLocation(_ index: Int) async throws -> Location {
        try await getItem(Location.self, index)
    }
    
    public func getEpisode(_ index: Int) async throws -> Episode {
        try await getItem(Episode.self, index)
    }
    
    public func getCharacters(for indices: [Int]) async throws -> [Character] {
        try await getItems(Character.self, indices)
    }
    
    public func getLocations(for indices: [Int]) async throws -> [Location] {
        try await getItems(Location.self, indices)
    }
    
    public func getEpisodes(for indices: [Int]) async throws -> [Episode] {
        try await getItems(Episode.self, indices)
    }
    
    public func getCharacters() async throws -> [CharacterResponse] {
        try await getItems(CharacterResponse.self)
    }
    
    public func getLocations() async throws -> [LocationResponse] {
        try await getItems(LocationResponse.self)
    }
    
    public func getEpisodes() async throws -> [EpisodeResponse] {
        try await getItems(EpisodeResponse.self)
    }
    
    public func getCharacters(with filters: [CharacterFilter]) async throws -> [CharacterResponse] {
        try await getItems(CharacterResponse.self, CharacterFilter.self, with: filters)
    }
    
    public func getLocations(with filters: [LocationFilter]) async throws -> [LocationResponse] {
        try await getItems(LocationResponse.self, LocationFilter.self, with: filters)
    }
    
    public func getEpisodes(with filters: [EpisodeFilter]) async throws -> [EpisodeResponse] {
        try await getItems(EpisodeResponse.self, EpisodeFilter.self, with: filters)
    }
    
    private func getItem<T: RawQueryable>(_ type: T.Type, _ index: Int) async throws -> T {
        guard index > 0 else { throw RMError.invalidIndex }
        return try await get(type.associatedURL.appendingPathComponent(index.description), of: T.self, decoder: .iso8601())
    }
    
    private func getItems<T: RawQueryable>(_ type: T.Type, _ indices: [Int] = []) async throws -> [T] {
        guard !indices.isEmpty else { throw RMError.emptyIndices }
        return try await get(type.associatedURL.appendingPathComponent(indices.map(\.description).joined(separator: ",")), of: [T].self, decoder: .iso8601())
    }
    
    private func getItems<T: Queryable>(_ type: T.Type) async throws -> [T] {
        try await get(type.associatedURL, of: [T].self, decoder: .iso8601())
    }
    
    private func getItems<T: Queryable, F: Filterable>(_ type: T.Type, _ filter: F.Type, with filters: [F] = []) async throws -> [T] {
        try await get(type.associatedURL, of: [T].self, parameters: filters.queryItems(), decoder: .iso8601())
    }
}
