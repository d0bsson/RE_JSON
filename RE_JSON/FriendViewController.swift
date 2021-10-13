//
//  ViewController.swift
//  RE_JSON
//
//  Created by Дэвид Бердников on 05.10.2021.
//

import UIKit

class FriendViewController: UITableViewController {
    
    let url = "https://pastebin.com/raw/43sXsbvq"
    var friends: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(friends)
        tableView.rowHeight = 300
    }
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friend", for: indexPath) as! FriendDetailsViewCell
        let friend = friends[indexPath.row]
        cell.configureCell(with: friend)
        
        return cell
    }
    
    // MARK: - UITableViewTableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Network
    func fetchFriends() {
        print("sdf")
        guard let url = URL(string: "https://pastebin.com/raw/43sXsbvq") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            print("session")
            guard let data = data else {
                print(error ?? "No error description")
                return
            }
            do {
                self.friends = try JSONDecoder().decode([Friend].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    print("decode")
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

