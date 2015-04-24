//
//  RVContactsTableViewCell.swift
//  RafaelValer
//
//  Created by Rafael Valer on 4/21/15.
//  Copyright (c) 2015 RafaelValer. All rights reserved.
//

import UIKit

class RVContactsTableViewCell: UITableViewCell {

    var contactInf:String?
    let imageLinks = ["emailImage", "githubImage", "linkedinImage", "facebookImage"]

    @IBOutlet weak var contactLink: UIButton!
    @IBOutlet weak var contactInfo: UILabel!
    @IBOutlet weak var linkButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func linkToUrl(sender: AnyObject) {
        var url:NSURL?
        url = NSURL(string: self.contactInf!)
        UIApplication.sharedApplication().openURL(url!)
    }
    
    func customizeAboutMeCell(tableCell:RVContactsTableViewCell, indexPath:NSIndexPath, dataDictionary:[AnyObject]){
        
        //email content cell
        if(indexPath.row == 0)
        {
            tableCell.contactInfo?.hidden = false
            tableCell.linkButton.hidden = true
            tableCell.contactInfo.text = dataDictionary[indexPath.row + 1] as? String
            
        }else{
            
            let buttonImage:UIImage? = UIImage(named: imageLinks[indexPath.row])
            tableCell.linkButton.setBackgroundImage(buttonImage, forState: .Normal)
            tableCell.contactInf = dataDictionary[indexPath.row + 1] as? String
            tableCell.contactInfo?.hidden = true
            tableCell.linkButton.hidden = false
            
        }
        
        tableCell.contactInfo.text = dataDictionary[indexPath.row + 1] as? String
        
    }
}
