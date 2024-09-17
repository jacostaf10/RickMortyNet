//
//  Protocols.swift
//  RickMortyNet
//
//  Created by Jorge Acosta Freire on 14/9/24.
//

import Foundation

public protocol RawQueryable: Codable, Sendable {
    static var associatedURL: URL { get }
}

public protocol Queryable: Codable, Sendable {
    static var associatedURL: URL { get }
}

public protocol Filterable {
    var queryItem: URLQueryItem { get }
}
