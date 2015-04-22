//
//  RVContentViewController.swift
//  RafaelValer
//
//  Created by Rafael Valer on 4/20/15.
//  Copyright (c) 2015 RafaelValer. All rights reserved.
//

import UIKit

class RVContentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pageHeader: UIView!
    @IBOutlet weak var pageTitle: UILabel!
   
    
    var dataObject: AnyObject?
    var dataDictionary = [AnyObject]()
    
    var pageController : RVPageViewController!
    
    var pageTitles = [String]()
    
    let grayColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1.0)
    let lightBlueColor = UIColor(red: 102/255, green: 171/255, blue: 1, alpha: 1.0)
    let lightOrangeColor = UIColor(red: 1, green: 171/255, blue: 102/255, alpha: 1.0)
    let lightGreenColor = UIColor(red: 113/255, green: 187/255, blue: 64/255, alpha: 1.0)
    let lightPurpleColor = UIColor(red: 210/255, green: 72/255, blue: 122/255, alpha: 1.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //pageController = RVPageViewController()
        
        tableView.delegate = self
        tableView.dataSource = self
        pageTitle.text = dataDictionary[0] as? String
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        setPageController()
        print(dataDictionary[0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        //plist has one attribute to set the title of view
        return dataDictionary.count - 1
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        println("% = \(scrollView.contentOffset.x / self.view.frame.size.width)")
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = customizeCell(indexPath)

        return cell
    }
    
   func setPageController() {
    
        let thisPage = dataDictionary[0] as? String
        if(thisPage == pageTitles[0]){
            pageController.pageControllerSwitch.currentPage = 0
            pageController.pageControllerSwitch.currentPageIndicatorTintColor = self.lightBlueColor
        }else if(thisPage == pageTitles[1]){
            pageController.pageControllerSwitch.currentPage = 1
            pageController.pageControllerSwitch.currentPageIndicatorTintColor = self.lightGreenColor
        }else if(thisPage == pageTitles[2]){
            pageController.pageControllerSwitch.currentPage = 2
            pageController.pageControllerSwitch.currentPageIndicatorTintColor = self.lightOrangeColor
        }else{
            pageController.pageControllerSwitch.currentPage = 3
            pageController.pageControllerSwitch.currentPageIndicatorTintColor = self.lightPurpleColor
        }
    }
    
    func cellColors(pageTitleColor:UIColor, pageHeaderColor: UIColor, tableViewSeparatorColor: UIColor, tableViewBackgroundColor: UIColor)
    {
        self.pageTitle.textColor = pageTitleColor
        self.pageHeader.backgroundColor = pageHeaderColor
        self.tableView.separatorColor = tableViewSeparatorColor
        self.backgroundView.backgroundColor = tableViewBackgroundColor
    }
    
    
    func customizeCell(indexPath: NSIndexPath) -> UITableViewCell{
        var cell:UITableViewCell!
        var colors = RVColors()
        
        if (dataDictionary[0] as? String == "About me"){
            
            cellColors(colors.grayColor, pageHeaderColor: colors.lightBlueColor, tableViewSeparatorColor: colors.lightBlueColor,
                tableViewBackgroundColor: colors.blueCellColor)
            
            let tableCell = tableView.dequeueReusableCellWithIdentifier("aboutMeCell") as! RVAboutMeTableViewCell
            tableCell.backgroundColor = UIColor.clearColor()
            
            if (indexPath.row == 0){
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
            
            cell = tableCell
            
            
        }else if (dataDictionary[0] as? String == "Experiences"){
            
            cellColors(colors.grayColor, pageHeaderColor: colors.lightGreenColor, tableViewSeparatorColor: colors.lightGreenColor,
                tableViewBackgroundColor: colors.greenCellColor)

            let tableCell = tableView.dequeueReusableCellWithIdentifier("experiencesCell") as! RVExperiencesTableViewCell
            tableCell.backgroundColor = UIColor.clearColor()
            
            tableCell.experienceTitle.text = dataDictionary[indexPath.row + 1][0] as? String
            tableCell.experiencePeriod.text = dataDictionary[indexPath.row + 1][1] as? String
            tableCell.experienceDescription.text = dataDictionary[indexPath.row + 1][2] as? String
            
            cell = tableCell
            
        }else if(dataDictionary[0] as? String == "Technical Skills"){
            
            cellColors(colors.grayColor, pageHeaderColor: colors.lightOrangeColor, tableViewSeparatorColor: colors.lightOrangeColor,
                tableViewBackgroundColor: colors.orangeCellColor)
            
            let tableCell = tableView.dequeueReusableCellWithIdentifier("technicalSkillsCell") as! RVTechnicalSkillsTableViewCell
            
            tableCell.backgroundColor = UIColor.clearColor()
            
            tableCell.technicalSkillsDescription.text = dataDictionary[indexPath.row + 1] as? String
            cell = tableCell
            
        }else if(dataDictionary[0] as? String == "Contact me"){
            
            cellColors(colors.grayColor, pageHeaderColor: colors.lightPurpleColor, tableViewSeparatorColor: colors.lightPurpleColor,
                tableViewBackgroundColor: colors.purpleCellColor)
            
            let tableCell = tableView.dequeueReusableCellWithIdentifier("contactsCell") as! RVContactsTableViewCell
            tableCell.backgroundColor = UIColor.clearColor()
            
            tableCell.contactInfo.text = dataDictionary[indexPath.row + 1] as? String
            cell = tableCell
        
        }else{
            cell = tableView.dequeueReusableCellWithIdentifier("aboutMeCell") as! RVAboutMeTableViewCell
        }
        
        return cell
    }
    
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if (dataDictionary[0] as? String == "About me"){
            if (indexPath.row == 0){
                return 225
            }else if (indexPath.row == 5){
                return 280
            }
            return 100
        }else if(dataDictionary[0] as? String == "Experiences"){
            return 200
        }else if(dataDictionary[0] as? String == "Technical Skills"){
            return 130
        }else if(dataDictionary[0] as? String == "Contact me"){
            return 100
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
