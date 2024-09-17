//
//  Filters.swift
//  RickMortyNet
//
//  Created by Jorge Acosta Freire on 14/9/24.
//

import Foundation

public enum CharacterFilter: Filterable {
    case name(String)
    case status(Character.Status)
    case species(String)
    case type(String)
    case gender(Character.Gender)
    
    public var queryItem: URLQueryItem {
        switch self {
        case .name(let name):
            URLQueryItem(name: "name", value: name.lowercased())
        case .status(let status):
            URLQueryItem(name: "status", value: status.rawValue.lowercased())
        case .species(let species):
            URLQueryItem(name: "species", value: species)
        case .type(let type):
            URLQueryItem(name: "type", value: type)
        case .gender(let gender):
            URLQueryItem(name: "gender", value: gender.rawValue.lowercased())
        }
    }
}

public enum LocationFilter: Filterable {
    case name(String)
    case type(String)
    case dimension(String)
    
    public var queryItem: URLQueryItem {
        switch self {
        case .name(let name):
            URLQueryItem(name: "name", value: name.lowercased())
        case .type(let type):
            URLQueryItem(name: "type", value: type)
        case .dimension(let dimension):
            URLQueryItem(name: "dimension", value: dimension)
        }
    }
}

public enum EpisodeFilter: Filterable {
    case name(String)
    case episode(String)
    
    public var queryItem: URLQueryItem {
        switch self {
        case .name(let name):
            URLQueryItem(name: "name", value: name.lowercased())
        case .episode(let episode):
            URLQueryItem(name: "episode", value: episode)
        }
    }
}
