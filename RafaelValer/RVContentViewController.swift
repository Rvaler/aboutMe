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
   
    
    var dataObject: AnyObject?
    var dataDictionary = [AnyObject]()
    
    let grayColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1.0)
    let lightBlueColor = UIColor(red: 102/255, green: 171/255, blue: 1, alpha: 1.0)
    let lightOrangeColor = UIColor(red: 1, green: 171/255, blue: 102/255, alpha: 1.0)
    let lightGreenColor = UIColor(red: 113/255, green: 187/255, blue: 64/255, alpha: 1.0)
    let aboutMeTitles = ["","Name", "Birthdate", "Born City", "Current City", "Education"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        pageTitle.text = dataDictionary[0] as? String
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
        
        //var cell:UITableViewCell!
        
        
        //configure image cell of about me
//        if (dataDictionary[0] == "About me"){
//            self.pageTitle.textColor = self.grayColor
//            self.pageHeader.backgroundColor = self.lightBlueColor
//            self.tableView.separatorColor = self.lightBlueColor
//            
//            let tableCell = tableView.dequeueReusableCellWithIdentifier("aboutMeCell") as! RVAboutMeTableViewCell
//            
//            if (indexPath.row == 0){
//                tableCell.profileImage.hidden = false
//                tableCell.cellTitle.text = ""
//            }else{
//                tableCell.cellTitle.text = aboutMeTitles[indexPath.row]
//                tableCell.info.text = dataDictionary[indexPath.row + 1] as String!
//            }
//            
//            cell = tableCell
//            
//            
//        }else if (dataDictionary[0] == "Schoolarship"){
//            let tableCell = tableView.dequeueReusableCellWithIdentifier("schoolarshipCell") as! RVSchoolarshipTableViewCell
//            
//            cell = tableCell
//            
//        }else{
//            cell = tableView.dequeueReusableCellWithIdentifier("aboutMeCell") as! RVAboutMeTableViewCell
//        }
        let cell:UITableViewCell = customizeCell(indexPath)
        
        return cell
    }
    
    func customizeCell(indexPath: NSIndexPath) -> UITableViewCell{
        var cell:UITableViewCell!
        
        if (dataDictionary[0] as? String == "About me"){
            self.pageTitle.textColor = self.grayColor
            self.pageHeader.backgroundColor = self.lightBlueColor
            self.tableView.separatorColor = self.lightBlueColor
            
            let tableCell = tableView.dequeueReusableCellWithIdentifier("aboutMeCell") as! RVAboutMeTableViewCell
            
            if (indexPath.row == 0){
                tableCell.profileImage.hidden = false
                tableCell.cellTitle.text = ""
            }else{
                tableCell.cellTitle.text = aboutMeTitles[indexPath.row]
                tableCell.info.text = dataDictionary[indexPath.row + 1] as? String
            }
            
            cell = tableCell
            
            
        }else if (dataDictionary[0] as? String == "Experiences"){
            
            
            self.pageTitle.textColor = self.grayColor
            self.pageHeader.backgroundColor = self.lightGreenColor
            self.tableView.separatorColor = self.lightGreenColor

            let tableCell = tableView.dequeueReusableCellWithIdentifier("experiencesCell") as! RVExperiencesTableViewCell
            
            tableCell.experienceTitle.text = dataDictionary[indexPath.row + 1][0] as? String
            tableCell.experiencePeriod.text = dataDictionary[indexPath.row + 1][1] as? String
            tableCell.experienceDescription.text = dataDictionary[indexPath.row + 1][2] as? String
            
            cell = tableCell
        }else if(dataDictionary[0] as? String == "Technical Skills"){
            
            self.pageTitle.textColor = self.grayColor
            self.pageHeader.backgroundColor = self.lightOrangeColor
            self.tableView.separatorColor = self.lightOrangeColor
        
            let tableCell = tableView.dequeueReusableCellWithIdentifier("technicalSkillsCell") as! RVTechnicalSkillsTableViewCell
            
            tableCell.technicalSkillsDescription.text = dataDictionary[indexPath.row + 1] as? String
            cell = tableCell
            
        }else{
            cell = tableView.dequeueReusableCellWithIdentifier("aboutMeCell") as! RVAboutMeTableViewCell
        }
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if (dataDictionary[0] as? String == "About me"){
            if (indexPath.row == 0){
                return 250
            }else if (indexPath.row == 5){
                return 280
            }
            return 100
        }else if(dataDictionary[0] as? String == "Experiences"){
            return 200
        }else if(dataDictionary[0] as? String == "Technical Skills"){
            return 130
        }
        
        return 200
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
