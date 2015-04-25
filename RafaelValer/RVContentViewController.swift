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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        pageTitle.text = dataDictionary[0] as? String
 
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        setPageController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        //plist has one attribute to set the title of view
        return dataDictionary.count - 1
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell = customizeCell(indexPath)
        return cell
    }
    
    
    func setPageController() {
    
    if let thisPage = dataDictionary[0] as? String{
        
        let colors = RVColors()
        
        if(thisPage == pageTitles[0]){
            pageController.pageControllerSwitch.currentPage = 0
            pageController.pageControllerSwitch.currentPageIndicatorTintColor = colors.lightBlueColor
        }else if(thisPage == pageTitles[1]){
            pageController.pageControllerSwitch.currentPage = 1
            pageController.pageControllerSwitch.currentPageIndicatorTintColor = colors.lightGreenColor
        }else if(thisPage == pageTitles[2]){
            pageController.pageControllerSwitch.currentPage = 2
            pageController.pageControllerSwitch.currentPageIndicatorTintColor = colors.lightOrangeColor
        }else if(thisPage == pageTitles[3]){
            pageController.pageControllerSwitch.currentPage = 3
            pageController.pageControllerSwitch.currentPageIndicatorTintColor = colors.blueColor
        }else if(thisPage == pageTitles[4]){
            pageController.pageControllerSwitch.currentPage = 4
            pageController.pageControllerSwitch.currentPageIndicatorTintColor = colors.lightPurpleColor
        }
    }
    
    }
    
    func cellColors(pageTitleColor:UIColor, pageHeaderColor: UIColor, tableViewSeparatorColor: UIColor, tableViewBackgroundColor: UIColor)
    {
        self.pageTitle.textColor = pageTitleColor
        self.tableView.separatorColor = tableViewSeparatorColor
        self.backgroundView.backgroundColor = tableViewBackgroundColor
        self.pageHeader.backgroundColor = pageHeaderColor
    }
    
    
    func customizeCell(indexPath: NSIndexPath) -> UITableViewCell
    {
        
        var cell:UITableViewCell!
        let colors = RVColors()
        
        // customizing cells of page ABOUT ME
        
        if (pageTitle.text == pageTitles[0]){
            
            cellColors(colors.grayColor, pageHeaderColor: colors.lightBlueColor, tableViewSeparatorColor: colors.lightBlueColor,
                tableViewBackgroundColor: colors.blueCellColor)
            
            let tableCell = tableView.dequeueReusableCellWithIdentifier("aboutMeCell") as! RVAboutMeTableViewCell
            tableCell.backgroundColor = UIColor.clearColor()
            
            tableCell.customizeAboutMeCell(tableCell, indexPath: indexPath, dataDictionary: dataDictionary)
            
            cell = tableCell
            
            
        // customizing cells of page EXPERIENCES
            
        }else if (pageTitle.text == pageTitles[1]){
            
            cellColors(colors.grayColor, pageHeaderColor: colors.lightGreenColor, tableViewSeparatorColor: colors.lightGreenColor,
                tableViewBackgroundColor: colors.greenCellColor)

            let tableCell = tableView.dequeueReusableCellWithIdentifier("experiencesCell") as! RVExperiencesTableViewCell
            tableCell.backgroundColor = UIColor.clearColor()
            
            tableCell.customizeExperiencesCell(tableCell, indexPath: indexPath, dataDictionary: dataDictionary)
            
            cell = tableCell
        
            
        // customizing cells of page TECHNICAL SKILLS
            
        }else if(pageTitle.text == pageTitles[2]){
            
            cellColors(colors.grayColor, pageHeaderColor: colors.lightOrangeColor, tableViewSeparatorColor: colors.lightOrangeColor,
                tableViewBackgroundColor: colors.orangeCellColor)
            
            let tableCell = tableView.dequeueReusableCellWithIdentifier("technicalSkillsCell") as! RVTechnicalSkillsTableViewCell
            tableCell.backgroundColor = UIColor.clearColor()
            
            tableCell.customizeTechnicalSkillsCell(tableCell, indexPath: indexPath, dataDictionary: dataDictionary)
            cell = tableCell
        
            
        // customizing cells of CONTACT ME
            
        }
        else if(pageTitle.text == pageTitles[3]){
            cellColors(colors.grayColor, pageHeaderColor: colors.blueColor, tableViewSeparatorColor: colors.blueColor, tableViewBackgroundColor: colors.mediumBlueCellColor)
            
            let tableCell = tableView.dequeueReusableCellWithIdentifier("myProjectsCell") as! RVMyProjectsTableViewCell
            tableCell.backgroundColor = UIColor.clearColor()
            
            tableCell.customizeMyProjectsCell(tableCell, indexPath: indexPath, dataDictionary: dataDictionary)
            cell = tableCell
        
        
        
        }
        else if(pageTitle.text == pageTitles[4]){
            
            cellColors(colors.grayColor, pageHeaderColor: colors.lightPurpleColor, tableViewSeparatorColor: colors.lightPurpleColor,
                tableViewBackgroundColor: colors.purpleCellColor)
            
            let tableCell = tableView.dequeueReusableCellWithIdentifier("contactsCell") as! RVContactsTableViewCell
            tableCell.backgroundColor = UIColor.clearColor()
            
            tableCell.customizeAboutMeCell(tableCell, indexPath: indexPath, dataDictionary: dataDictionary)
            cell = tableCell
        }
        return cell
    }
    
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        
        if (pageTitle.text == pageTitles[0]){
            if (indexPath.row == 0){
                return 225
            }else if (indexPath.row == 5){
                return 280
            }
            return 100
            
        }else if(pageTitle.text == pageTitles[1]){
            return 200
        }else if(pageTitle.text == pageTitles[2]){
            return 130
        }else if(pageTitle).text == pageTitles[3]{
            return 300
        }else if(pageTitle.text == pageTitles[4]){
            
            if(indexPath.row == 0){
                return 70
            }
            return 150
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
