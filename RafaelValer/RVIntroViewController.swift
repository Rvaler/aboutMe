//
//  RVIntroViewController.swift
//  RafaelValer
//
//  Created by Rafael Valer on 4/25/15.
//  Copyright (c) 2015 RafaelValer. All rights reserved.
//

import UIKit

class RVIntroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var myTimer:NSTimer? = NSTimer.scheduledTimerWithTimeInterval(1.8, target: self, selector: "signInApp", userInfo: nil, repeats: false)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func signInApp(){
        self.performSegueWithIdentifier("segueIntroToResume", sender: self)
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
