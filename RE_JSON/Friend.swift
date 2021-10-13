//
//  Friend.swift
//  RE_JSON
//
//  Created by Дэвид Бердников on 05.10.2021.
//

import Foundation


struct Friend: Decodable {
    let name: String?
    let skill: String?
    let photo: String?
}

struct friendsData {
    let friends: [Friend]
}
