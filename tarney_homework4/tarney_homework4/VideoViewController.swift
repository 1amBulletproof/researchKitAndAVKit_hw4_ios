//
//  VideoViewController.swift
//  tarney_homework4
//
//  Created by Brandon Tarney on 4/2/18.
//  Copyright © 2018 Johns Hopkins University. All rights reserved.
//
import UIKit
import AVKit
import AVFoundation

class VideoViewController: UIViewController, AVPlayerViewControllerDelegate  {
    //TODO:
//        1. Create Thumbnails for videos
//            - Use AVAssetImageGenerator async generation
//        1. Segue to proper full-screen video player
    
    @IBOutlet weak var thumbNail1: UIImageView!
    @IBOutlet weak var thumbNail2: UIImageView!
    @IBOutlet weak var thumbNail3: UIImageView!
    
    var url:URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        print("prepare for segue")
        let destinationVC = segue.destination as! AVPlayerViewController
        destinationVC.delegate = self
        
        guard let movieURL = self.url else { return }
        
        destinationVC.player = AVPlayer(url: movieURL)
    }
    
    func playerViewController(_ playerViewController: AVPlayerViewController, restoreUserInterfaceForPictureInPictureStopWithCompletionHandler completionHandler: @escaping (Bool) -> Void) {
        present(playerViewController, animated: true)
        {
            completionHandler(false)
        }
    }
    
    @IBAction func playVideo1(_ sender: Any) {
        print("play video 1")
        self.url = URL(string: "https://www.cdc.gov/flu/video/flushots_60sec.mp4")
        //https://www.cdc.gov/flu/video/flushots_60sec.mp4
        
        performSegue(withIdentifier: "PlayVideo", sender: self)
    }
    
    @IBAction func playVideo2(_ sender: Any) {
        print("play video 2")
        self.url = URL(string: "https://www.cdc.gov/flu/video/who-needs-flu-vaccine-30_320px.mp4")
        //https://www.cdc.gov/flu/video/who-needs-flu-vaccine-30_320px.mp4
                performSegue(withIdentifier: "PlayVideo", sender: self)
    }
    
    @IBAction func playVideo3(_ sender: Any) {
        print("play video 3")
        self.url = URL(string: "https://www.cdc.gov/flu/video/inever_60sec.mp4")
        //https://www.cdc.gov/flu/video/inever_60sec.mp4
                performSegue(withIdentifier: "PlayVideo", sender: self)
    }
    
}





