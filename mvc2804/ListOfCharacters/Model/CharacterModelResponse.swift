//
//  CharacterModelResponse.swift
//  mvc2804
//
//  Created by Danil Antonov on 28.04.2024.
//

import Foundation

struct CharacterModelResponse: Decodable {
    let results: [CharacterModel]
}
