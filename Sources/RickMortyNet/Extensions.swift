//
//  Extensions.swift
//  RickMortyNet
//
//  Created by Jorge Acosta Freire on 14/9/24.
//

import Foundation

extension Array where Element: Filterable {
    func queryItems() -> [URLQueryItem] {
        map(\.queryItem)
    }
}
