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
    var surveyTaskViewController:ORKTaskViewController!
    var coughTaskViewController:ORKTaskViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func startResearchButtonPressed(_ sender: Any) {
        self.consentTaskViewController = ORKTaskViewController(task: ConsentTask, taskRun: nil)
        self.consentTaskViewController.outputDirectory = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0], isDirectory: true)
        self.consentTaskViewController.delegate = self
        present(self.consentTaskViewController, animated: true, completion: nil)
    }
}
    
extension ViewController : ORKTaskViewControllerDelegate {
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {

        //dismiss the previous taskViewController
        dismiss(animated: true, completion: nil)
        
        if reason != ORKTaskViewControllerFinishReason.discarded {
            //consent task ended
            if self.consentTaskViewController == taskViewController {
                writeResultToFile(taskViewController: self.consentTaskViewController, type: "consent")
                print("done with consent form!")
                
                //Time for Flu Survey
                self.surveyTaskViewController = ORKTaskViewController(task: FluSurveyTask, taskRun: nil)
                self.surveyTaskViewController.outputDirectory = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0], isDirectory: true)
                self.surveyTaskViewController.delegate = self
                present(self.surveyTaskViewController, animated: true, completion: nil)
            }
                //survey task ended
            else if self.surveyTaskViewController == taskViewController {
                writeResultToFile(taskViewController: self.surveyTaskViewController, type: "flu_survey")
                print("Done with survey form")
                
                //Time for the Cough Active Test
                self.coughTaskViewController = ORKTaskViewController(task: CoughActiveTask, taskRun: nil)
                self.coughTaskViewController.outputDirectory =
                    URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0], isDirectory: true)
                self.coughTaskViewController.delegate = self
                present(self.coughTaskViewController, animated: true, completion: nil)
            }
                //Cough active task ended
            else if self.coughTaskViewController == taskViewController {
                writeResultToFile(taskViewController: self.coughTaskViewController, type: "cough_active_test")
                print("Done with cough test")
                
                for view in self.view.subviews {
                    view.isHidden = true
                }
                
                let randomResult = arc4random_uniform(2)
                let completeLabel = UILabel(frame: CGRect(x: 50, y: 200, width: 300, height: 50))
                completeLabel.center = CGPoint(x: 200, y: 300)
                completeLabel.textAlignment = .center
                if (randomResult == 0) {
                    completeLabel.text = "You don't have the Flu. WooHoo!"
                } else {
                    completeLabel.text = "You've got the Flu. Womp. Womp."
                }
                self.view.addSubview(completeLabel)
                
            }
            else {
                print("Error: some other task returned here?!")
            }
        }
    }
    
    func writeResultToFile(taskViewController: ORKTaskViewController, type:String) {
        let path = taskViewController.outputDirectory
        let fileString = "\((path?.path)!)/\(type)-data.obj"
        let success = NSKeyedArchiver.archiveRootObject(taskViewController.result, toFile: fileString)
        print("file write success \(success)")
    }

}

