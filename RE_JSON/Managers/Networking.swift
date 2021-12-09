//
//  Networking.swift
//  RE_JSON
//
//  Created by Дэвид Бердников on 07.10.2021.
//

import Foundation

class Networking {
    static let shared = Networking()
    
    private init() {}
    
    let url = "https://breakingbadapi.com/api/characters"
    
    func fetchFriends(from url: String?, with comlition: @escaping ([Character]) -> Void) {
        guard let stringURL = url else { return }
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                print(error ?? "No error description")
                return
            }
            do {
                let character = try JSONDecoder().decode([Character].self, from: data)
                DispatchQueue.main.async {
                    comlition(character)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
