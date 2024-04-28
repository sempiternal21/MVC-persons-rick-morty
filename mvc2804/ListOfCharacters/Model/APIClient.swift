//
//  APIClient.swift
//  mvc2804
//
//  Created by Danil Antonov on 28.04.2024.
//

import Foundation

final class ListOfCharactersAPIClient {
    func getListOfCharacters() async -> CharacterModelResponse {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(CharacterModelResponse.self, from: data)
    }
}
