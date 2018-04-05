//
//  ViewController.swift
//  tarney_homework4
//
//  Created by Brandon Tarney on 3/26/18.
//  Copyright © 2018 Johns Hopkins University. All rights reserved.
//

import UIKit
import ResearchKit

class ViewController: UIViewController {

    var consentTaskViewController:ORKTaskViewController!
    var tappingTaskViewController:ORKTaskViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func startResearchButtonPressed(_ sender: Any) {
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
                /*
        if reason != ORKTaskViewControllerFinishReason.discarded
        {
            if self.consentTaskViewController == taskViewController
            {
                writeResultToFile(taskViewController: consentTaskViewController, type: "consent")
                print("done with consent form!")
                
                //Time for the Survey (AND MIC??)
//                tappingTaskViewController = ORKTaskViewController(task: TappingTask, taskRun: nil)
//                tappingTaskViewController.outputDirectory = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0], isDirectory: true)
//                tappingTaskViewController.delegate = self
//                present(tappingTaskViewController, animated: true, completion: nil)
            }
            else //Survey task completion
            {
//                writeResultToFile(taskViewController: tappingTaskViewController, type: "tapping")
//                print("Done with tapping form")
            }
            
        }
 */
    }
    
    func writeResultToFile(taskViewController: ORKTaskViewController, type:String)
    {
        let path = taskViewController.outputDirectory
        let fileString = "\((path?.path)!)/\(type)-data.obj"
        let success = NSKeyedArchiver.archiveRootObject(taskViewController.result, toFile: fileString)
        print("file write success \(success)")
    }

}

