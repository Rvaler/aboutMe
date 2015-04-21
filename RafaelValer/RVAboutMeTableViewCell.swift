//
//  RVAboutMeTableViewCell.swift
//  RafaelValer
//
//  Created by Rafael Valer on 4/20/15.
//  Copyright (c) 2015 RafaelValer. All rights reserved.
//

import UIKit

class RVAboutMeTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var info: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
