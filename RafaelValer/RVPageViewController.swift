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
    let colors = RVColors()

    
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
        pageContent = ["About me", "Experiences", "Technical Skills", "My Projects", "Contact me"]
        
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
