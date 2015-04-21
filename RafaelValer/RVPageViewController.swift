//
//  RVPageViewController.swift
//  RafaelValer
//
//  Created by Rafael Valer on 4/20/15.
//  Copyright (c) 2015 RafaelValer. All rights reserved.
//

import UIKit

class RVPageViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    var pageController: UIPageViewController?
    var pageContent = NSArray()
    var userInfo:NSDictionary?
    
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
        pageStrings.append("Skills")
        pageStrings.append("Contacts")
        //pageStrings.append("Skills")
        /*
        for i in 1...4
        {
            let contentString = "lala \(i)"
            pageStrings.append(contentString)
        }
*/
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
        //dataViewController.dataDictionary = userInfo?.objectForKey(pageContent[index] as! String)
        dataViewController.dataDictionary = userInfo?.objectForKey(pageContent[index]) as! [(AnyObject)]
        return dataViewController
    }
    
    func indexOfViewController(viewController: RVContentViewController) -> Int {
        
        if let dataObject: AnyObject = viewController.dataObject{
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
