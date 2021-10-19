//
//  DriendDetailsViewController.swift
//  RE_JSON
//
//  Created by Дэвид Бердников on 07.10.2021.
//

import UIKit

class FriendDetailsViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var skillLabel: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    
    var friend: Friend!
    
    func configureCell(with friend: Friend) {
        nameLabel.text = friend.name
        skillLabel.text = friend.skill
//        DispatchQueue.global().async {
            guard let url = URL(string: friend.photo ?? "") else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.photoImage.image = UIImage(data: imageData)
            }
//        }
    }
}
