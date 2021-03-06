//
//  RVExperiencesTableViewCell.swift
//  RafaelValer
//
//  Created by Rafael Valer on 4/21/15.
//  Copyright (c) 2015 RafaelValer. All rights reserved.
//

import UIKit

class RVExperiencesTableViewCell: UITableViewCell {

    @IBOutlet weak var experienceTitle: UILabel!
    @IBOutlet weak var experiencePeriod: UILabel!
    @IBOutlet weak var experienceDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func customizeExperiencesCell(tableCell:RVExperiencesTableViewCell, indexPath:NSIndexPath, dataDictionary:[AnyObject]){
        
        tableCell.experienceTitle.text = dataDictionary[indexPath.row + 1][0] as? String
        tableCell.experiencePeriod.text = dataDictionary[indexPath.row + 1][1] as? String
        tableCell.experienceDescription.text = dataDictionary[indexPath.row + 1][2] as? String
        
    }
}
