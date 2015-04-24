//
//  RVAboutMeTableViewCell.swift
//  RafaelValer
//
//  Created by Rafael Valer on 4/20/15.
//  Copyright (c) 2015 RafaelValer. All rights reserved.
//

import UIKit

class RVAboutMeTableViewCell: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!
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
    
    func customizeAboutMeCell(tableCell:RVAboutMeTableViewCell, indexPath:NSIndexPath, dataDictionary:[AnyObject]){
        
        // special treatment to set the profile image
        if (indexPath.row == 0)
        {
            tableCell.profileImage.hidden = false
            tableCell.profileImage.layer.cornerRadius = tableCell.profileImage.frame.size.width / 2
            tableCell.profileImage.clipsToBounds = true
            tableCell.cellTitle.text = ""
            
        }else{
            
            tableCell.profileImage.hidden = true
            let aboutMeTitles = ["","Name", "Birthdate", "Born City", "Current City", "Education"]
            tableCell.cellTitle.text = aboutMeTitles[indexPath.row]
            tableCell.info.text = dataDictionary[indexPath.row + 1] as? String
            
        }

    }

}
