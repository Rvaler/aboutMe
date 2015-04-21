//
//  RVContentViewController.swift
//  RafaelValer
//
//  Created by Rafael Valer on 4/20/15.
//  Copyright (c) 2015 RafaelValer. All rights reserved.
//

import UIKit

class RVContentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pageHeader: UIView!
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    var dataObject: AnyObject?
    var dataDictionary = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        pageTitle.text = dataDictionary[0]
        print(dataDictionary)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    /*
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }*/
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        //plist has one attribute to set the title of view
        return dataDictionary.count - 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell
        var cell:UITableViewCell
        // Configure the cell...
        
        //configure image cell of about me
        if (dataDictionary[0] == "About me"){
            let tableCell = tableView.dequeueReusableCellWithIdentifier("aboutMeCell") as! RVAboutMeTableViewCell
            if (indexPath.row == 0){
                tableCell.profileImage.hidden = false
            }
            tableCell.info.text = dataDictionary[indexPath.row + 1] as String!
            cell = tableCell
        }else{
            cell = tableView.dequeueReusableCellWithIdentifier("aboutMeCell") as! RVAboutMeTableViewCell
        }
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
