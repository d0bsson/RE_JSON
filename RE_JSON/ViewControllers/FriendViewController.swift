//
//  ViewController.swift
//  RE_JSON
//
//  Created by Дэвид Бердников on 05.10.2021.
//

import UIKit

class FriendViewController: UITableViewController {
    
    var characters: [Character] = []
    var character: Character!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 200
        fetchCharacters(from: Networking.shared.url)
    }
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
                .dequeueReusableCell(withIdentifier: "friend", for: indexPath) as? CharacterTableViewCell else { return UITableViewCell() }
        let friend = characters[indexPath.row]
        cell.backgroundColor = .systemTeal
        cell.configureCell(with: friend)
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "friend", for: indexPath)
//        let character = characters[indexPath.row]
//
//        var content = cell.defaultContentConfiguration()
//        content.text = character.name
//        content.secondaryText = character.nickname
//
//        cell.contentConfiguration = content
//        return cell
//    }
    
    // MARK: - UITableViewTableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func fetchCharacters(from url: String) {
        Networking.shared.fetchFriends(from: url) { character in
            self.characters = character
            self.tableView.reloadData()
        }
    }
}
