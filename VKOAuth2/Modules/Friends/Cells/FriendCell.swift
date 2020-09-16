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
    @IBOutlet weak var userOnlineView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.photoImageView.layer.cornerRadius = self.photoImageView.frame.height / 2
        self.photoImageView.clipsToBounds = true
        
        self.userOnlineView.clipsToBounds = true
        self.userOnlineView.layer.cornerRadius = self.userOnlineView.frame.height / 2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configure(with user: User) {
        self.nameLabel.text = "\(user.firstName) \(user.lastName)"
        self.photoImageView.sd_setImage(with: URL(string: user.photo200_Orig))
        
        self.userOnlineView.backgroundColor = user.online == 1 ? #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1) : .systemGray2
    }
}
