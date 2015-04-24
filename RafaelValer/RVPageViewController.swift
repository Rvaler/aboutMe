//
//  RVPageViewController.swift
//  RafaelValer
//
//  Created by Rafael Valer on 4/20/15.
//  Copyright (c) 2015 RafaelValer. All rights reserved.
//

import UIKit

class RVPageViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate, UIScrollViewDelegate {

    var pageController: UIPageViewController?
    var pageContent = NSArray()
    var userInfo:NSDictionary?
    var indexOfPage = 0
    var lastContentOffset:CGFloat?
    
    var currentRed:CGFloat = 0
    var currentGreen:CGFloat = 0
    var currentBlue:CGFloat = 0
    var currentAlpha:CGFloat = 0
    
    var nextRed:CGFloat = 0
    var nextGreen:CGFloat = 0
    var nextBlue:CGFloat = 0
    var nextAlpha:CGFloat = 0
    
    var scrollFinished = 0
    var direction:String?
    
    var colors = RVColors()
    
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var pageControllerView: UIView!
    @IBOutlet weak var pageControllerSwitch: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createContentPages()
        
        pageController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        
        pageController?.delegate = self
        pageController?.dataSource = self
        
        let startingViewController: RVContentViewController = viewControllerAtIndex(0)!
        
        let viewControllers: NSArray = [startingViewController]
        pageController!.setViewControllers(viewControllers as [AnyObject], direction: .Forward, animated: false, completion: nil)
        
        self.addChildViewController(pageController!)
        self.view.addSubview(self.pageController!.view)
        
        titleView.backgroundColor = colors.lightBlueColor
        
        var pageViewRect = self.view.bounds
        pageController!.view.frame = pageViewRect
        pageController!.didMoveToParentViewController(self)
        
        for sview in pageController!.view.subviews
        {
            if(sview.isKindOfClass(UIScrollView))
            {
                let scrollV : UIScrollView = sview as! UIScrollView
                scrollV.delegate = self
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createContentPages(){
        
        let dic = RVUserInfo.init()
        userInfo = dic.info
        
        var pageStrings = [String]()
        
        pageStrings.append("About me")
        pageStrings.append("Experiences")
        pageStrings.append("Technical Skills")
        pageStrings.append("Contact me")
        
        pageContent = pageStrings
    }
    
   
    func viewControllerAtIndex(index: Int) -> RVContentViewController? {
        
        if (pageContent.count == 0) ||
            (index >= pageContent.count) {
                return nil
        }
        
        let storyBoard = UIStoryboard(name: "Main",
            bundle: NSBundle.mainBundle())
        let dataViewController = storyBoard.instantiateViewControllerWithIdentifier("contentView") as! RVContentViewController
        
        dataViewController.dataObject = pageContent[index]
        
        dataViewController.pageController = self
        
        
        dataViewController.pageTitles = pageContent as! [(String)]
        dataViewController.dataDictionary = userInfo?.objectForKey(pageContent[index]) as! [(AnyObject)]
        return dataViewController
        
    }
    


    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //titleView.backgroundColor.
        
        
        let colorsArray = [colors.lightBlueColor, colors.lightGreenColor, colors.lightOrangeColor, colors.lightPurpleColor]
        
        if(scrollFinished == 0){

            if (self.lastContentOffset > scrollView.contentOffset.x){
                if(indexOfPage > 0){
                    var nextColor = colorsArray[indexOfPage - 1]
                    var currentColor = colorsArray[indexOfPage]
                    
                    
                    currentColor.getRed(&currentRed, green: &currentGreen, blue: &currentBlue, alpha: &currentAlpha)
                    
                    nextColor.getRed(&nextRed, green: &nextGreen, blue: &nextBlue, alpha: &nextAlpha)
                    
                    direction = "left"
                }
            }
                
            else if (self.lastContentOffset < scrollView.contentOffset.x){
                if(indexOfPage < colorsArray.count - 1){
                    var nextColor = colorsArray[indexOfPage + 1]
                    var currentColor = colorsArray[indexOfPage]
                    
                    currentColor.getRed(&currentRed, green: &currentGreen, blue: &currentBlue, alpha: &currentAlpha)
                    
                    nextColor.getRed(&nextRed, green: &nextGreen, blue: &nextBlue, alpha: &nextAlpha)
                    
                    direction = "right"
                }
                
                
            }
            scrollFinished = 1
            
        }
        
        
        self.lastContentOffset = scrollView.contentOffset.x;
        
        var teste: CGFloat = (scrollView.contentOffset.x) / (self.view.frame.size.width)
        
        
        if((teste <= 1.01 || teste >= 1.99 ) && direction == "right"){
            scrollFinished = 0
        }
        if((teste <= 0.01 || teste >= 0.99 ) && direction == "left"){
            scrollFinished = 0
        }
        
        
        var newRed:CGFloat?
        var newGreen:CGFloat?
        var newBlue:CGFloat?
        
        
        
        if(direction == "right" && scrollFinished == 1 ){
            newRed = (2.0 - teste) * currentRed + (teste - 1) * nextRed
            newGreen = (2.0 - teste) * currentGreen + (teste - 1) * nextGreen
            newBlue = (2.0 - teste) * currentBlue + (teste - 1) * nextBlue
            
            titleView.backgroundColor = UIColor(red: newRed!, green: newGreen!, blue: newBlue!, alpha: 1)
        }
        else if(direction == "left" && scrollFinished == 1){
            newRed = teste * currentRed + (1 - teste) * nextRed
            newGreen = teste * currentGreen + (1 - teste) * nextGreen
            newBlue = teste * currentBlue + (1 - teste) * nextBlue
            
            titleView.backgroundColor = UIColor(red: newRed!, green: newGreen!, blue: newBlue!, alpha: 1)
        }
            
        
    }
    
    
    func indexOfViewController(viewController: RVContentViewController) -> Int {
        
        if let dataObject: AnyObject = viewController.dataObject{
            indexOfPage = pageContent.indexOfObject(dataObject)
            return pageContent.indexOfObject(dataObject)
        }else{
            return NSNotFound
        }
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        var index = indexOfViewController(viewController as! RVContentViewController)
        
        if (index == 0) || (index == NSNotFound){
            return nil
        }
        
        index--;
        return viewControllerAtIndex(index)
    
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        var index = indexOfViewController(viewController as! RVContentViewController)
        
        if (index == NSNotFound){
            return nil
        }
        
        index++;
        if (index == pageContent.count){
            return nil
        }
        return viewControllerAtIndex(index)
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
