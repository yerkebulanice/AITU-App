//
//  ImportantFriendsTableViewCell.swift
//  Social Media App (Endterm Project)
//
//  Created by Еркебулан on 24.02.2021.
//

import UIKit

class ImportantFriendsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
