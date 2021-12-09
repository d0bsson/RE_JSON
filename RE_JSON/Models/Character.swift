//
//  Friend.swift
//  RE_JSON
//
//  Created by Дэвид Бердников on 05.10.2021.
//

import Foundation


struct Character: Decodable {
    let name: String?
    let nickname: String?
    let img: String?
}

struct characterData {
    let characters: [Character]
}
