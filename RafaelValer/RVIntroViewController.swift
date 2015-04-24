//
//  RVIntroViewController.swift
//  RafaelValer
//
//  Created by Rafael Valer on 4/24/15.
//  Copyright (c) 2015 RafaelValer. All rights reserved.
//

import UIKit

class RVIntroViewController: UIViewController {

    @IBOutlet weak var blueBottomBar: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animateWithDuration(1.0, delay: 1.2, options: .CurveEaseOut, animations: {
            
            var fabricBottomFrame = self.blueBottomBar.frame
            fabricBottomFrame.origin.y += fabricBottomFrame.size.height
            
            self.blueBottomBar.frame = fabricBottomFrame
            }, completion: { finished in
                println("Napkins opened!")
        })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
