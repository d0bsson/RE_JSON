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
    
    var character: Character!
    
    func configureCell(with character: Character) {
        nameLabel.text = character.name
        skillLabel.text = character.nickname
        DispatchQueue.global().async {
            guard let url = URL(string: character.img ?? "") else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.photoImage.image = UIImage(data: imageData)
            }
        }
    }
}

