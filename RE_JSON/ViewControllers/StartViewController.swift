//
//  StartViewController.swift
//  RE_JSON
//
//  Created by Дэвид Бердников on 12.10.2021.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Hello!" 
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let friendVC = segue.destination as? FriendViewController else { return }
        friendVC.fetchFriends()
    }
    

}
