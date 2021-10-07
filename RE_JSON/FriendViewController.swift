//
//  ViewController.swift
//  RE_JSON
//
//  Created by Дэвид Бердников on 05.10.2021.
//

import UIKit

enum UserActions: String, CaseIterable {
    case drew = "DREW"
    case max = "MAX"
    case polina = "Polina"
}

class FriendViewController: UITableViewController {
    
    let friends = UserActions.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friend", for: indexPath)
        let friend = friends[indexPath.row]
        cell.textLabel?.text = friends[indexPath.row].rawValue
        print(friends[indexPath.row].rawValue)
        return cell
    }
    
    // MARK: - UITableViewTableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Network
    
    
}

