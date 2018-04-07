//
//  TabViewController.swift
//  tarney_homework4
//
//  Created by Brandon Tarney on 4/7/18.
//  Copyright © 2018 Johns Hopkins University. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fluViewController = self.viewControllers![0]
        fluViewController.title = "Flu Study"
        
        let videoViewController = self.viewControllers![1]
        videoViewController.title = "Videos"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
