//
//  RVTechnicalSkillsTableViewCell.swift
//  RafaelValer
//
//  Created by Rafael Valer on 4/21/15.
//  Copyright (c) 2015 RafaelValer. All rights reserved.
//

import UIKit

class RVTechnicalSkillsTableViewCell: UITableViewCell {

    @IBOutlet weak var technicalSkillsDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func customizeTechnicalSkillsCell(tableCell:RVTechnicalSkillsTableViewCell, indexPath:NSIndexPath, dataDictionary:[AnyObject]){

        tableCell.technicalSkillsDescription.text = dataDictionary[indexPath.row + 1] as? String
    }
}
