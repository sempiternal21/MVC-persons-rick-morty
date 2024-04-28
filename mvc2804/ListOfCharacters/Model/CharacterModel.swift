//
//  CharacterModel.swift
//  mvc2804
//
//  Created by Danil Antonov on 28.04.2024.
//

import Foundation

struct CharacterModel: Decodable {
    let id: Int32
    let name: String
    let status: String
    let species: String
    let image: String
}
