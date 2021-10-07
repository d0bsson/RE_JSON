//
//  ViewController.swift
//  RE_JSON
//
//  Created by Дэвид Бердников on 05.10.2021.
//

import UIKit

class FriendViewController: UITableViewController {
    
    private let friends = ["pastebin", "pastebin", "pastebin"]
    private let url = "https://pastebin.com/raw/43sXsbvq"
    
    // MARK: UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friend", for: indexPath)
        let friend = friends[indexPath.row]
        print(cell)
        return cell
    }
    
    
}

