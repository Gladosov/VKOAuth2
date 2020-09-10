//
//  FriendCell.swift
//  VKOAuth2
//
//  Created by Admin on 10.09.2020.
//  Copyright © 2020 Danil Semenov. All rights reserved.
//

import UIKit
import SDWebImage

class FriendCell: UITableViewCell {
    
    static let identifier = "FriendCell"

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.photoImageView.layer.cornerRadius = 50
        self.photoImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configure(with user: User) {
        self.nameLabel.text = "\(user.firstName) \(user.lastName)"
        self.photoImageView.sd_setImage(with: URL(string: user.photo200_Orig))
    }
}
