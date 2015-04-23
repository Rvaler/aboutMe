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

}
