//
//  RVMyProjectsTableViewCell.swift
//  RafaelValer
//
//  Created by Rafael Valer on 4/24/15.
//  Copyright (c) 2015 RafaelValer. All rights reserved.
//

import UIKit

class RVMyProjectsTableViewCell: UITableViewCell {

    @IBOutlet weak var projectImage: UIImageView!
    @IBOutlet weak var projectTitle: UILabel!
    @IBOutlet weak var projectDescription: UILabel!
    
    let imageNames = ["mogImage", "colaboreImage", "gimmebackImage"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func customizeMyProjectsCell(tableCell:RVMyProjectsTableViewCell, indexPath:NSIndexPath, dataDictionary:[AnyObject]){
        
        let appImage:UIImage? = UIImage(named: imageNames[indexPath.row])
        tableCell.projectImage.image = appImage
        tableCell.projectImage.layer.cornerRadius = 12.0
        tableCell.projectImage.layer.masksToBounds = true
        
        tableCell.projectTitle.text = dataDictionary[indexPath.row + 1][0] as? String
        tableCell.projectDescription.text = dataDictionary[indexPath.row + 1][1] as? String
        
    }
    
}
