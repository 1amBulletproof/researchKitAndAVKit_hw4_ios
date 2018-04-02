//
//  ViewController.swift
//  tarney_homework4
//
//  Created by Brandon Tarney on 3/26/18.
//  Copyright © 2018 Johns Hopkins University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //basically just need to override the right researchkit tasks/properties and use them and researchkit presents all the screens you need
        //Collect the output when you're said-and-done
    }
    
    //see "consent" files in example code to see the overriden properties


}

/* Copied from example:
 //
 //  ViewController.swift
 //  ResearchKitExample
 //
 //  Created by Teacher on 9/24/17.
 //  Copyright © 2017 Teacher. All rights reserved.
 //
 
 import UIKit
 import ResearchKit
 
 class ViewController: UIViewController
 {
 
 var consentTaskViewController:ORKTaskViewController!
 var tappingTaskViewController:ORKTaskViewController!
 
 
 override func viewDidLoad() {
 super.viewDidLoad()
 // Do any additional setup after loading the view, typically from a nib.
 }
 
 override func didReceiveMemoryWarning() {
 super.didReceiveMemoryWarning()
 // Dispose of any resources that can be recreated.
 }
 
 
 @IBAction func startResearchButtonPressed(_ sender: Any)
 {
 consentTaskViewController = ORKTaskViewController(task: ConsentTask, taskRun: nil)
 consentTaskViewController.outputDirectory = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0], isDirectory: true)
 consentTaskViewController.delegate = self
 present(consentTaskViewController, animated: true, completion: nil)
 }
 
 
 }
 
 extension ViewController : ORKTaskViewControllerDelegate
 {
 func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?)
 {
 dismiss(animated: true, completion: nil)
 
 if reason != ORKTaskViewControllerFinishReason.discarded
 {
 
 if consentTaskViewController == taskViewController
 {
 writeResultToFile(taskViewController: consentTaskViewController, type: "consent")
 print("done with consent form!")
 
 tappingTaskViewController = ORKTaskViewController(task: TappingTask, taskRun: nil)
 tappingTaskViewController.outputDirectory = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0], isDirectory: true)
 tappingTaskViewController.delegate = self
 present(tappingTaskViewController, animated: true, completion: nil)
 }
 else
 {
 writeResultToFile(taskViewController: tappingTaskViewController, type: "tapping")
 print("Done with tapping form")
 }
 
 }
 }
 
 func writeResultToFile(taskViewController: ORKTaskViewController, type:String)
 {
 let path = consentTaskViewController.outputDirectory
 let fileString = "\((path?.path)!)/\(type)-data.obj"
 let success = NSKeyedArchiver.archiveRootObject(taskViewController.result, toFile: fileString)
 print("file write success \(success)")
 }
 
 
 
 
 
 }
 
*/

