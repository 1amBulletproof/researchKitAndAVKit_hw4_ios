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
import CoreMedia

class VideoViewController: UIViewController, AVPlayerViewControllerDelegate  {
    
    @IBOutlet weak var thumbNail1: UIImageView!
    @IBOutlet weak var thumbNail2: UIImageView!
    @IBOutlet weak var thumbNail3: UIImageView!
    
    let video1Url = "https://www.cdc.gov/flu/video/flushots_60sec.mp4"
    let video2Url = "https://www.cdc.gov/flu/video/who-needs-flu-vaccine-30_320px.mp4"
    let video3Url = "https://www.cdc.gov/flu/video/inever_60sec.mp4"
    
    var url:URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Videos"
        
        let startTime = CMTime(seconds: 5, preferredTimescale: 1)
        let startTimeVal = NSValue.init(time: startTime)
        
        //Load video assets
        let asset1Generator = AVAssetImageGenerator(
            asset: AVAsset(url: URL(string: self.video1Url)!))
        asset1Generator.generateCGImagesAsynchronously(forTimes: [startTimeVal]) { (requestedTime, image, actualTime, result, error) in
            if let myImage = image {
                print("got an image")
                DispatchQueue.main.async {
                    self.thumbNail1.image = UIImage(cgImage: myImage)
                }
            } else {
                print(error.debugDescription)
            }
        }
        
        let asset2Generator = AVAssetImageGenerator(
            asset: AVAsset(url: URL(string: self.video2Url)!))
        asset2Generator.generateCGImagesAsynchronously(forTimes: [startTimeVal]) { (requestedTime, image, actualTime, result, error) in
            if let myImage = image {
                print("got an image")
                DispatchQueue.main.async {
                    self.thumbNail2.image = UIImage(cgImage: myImage)
                }
            } else {
                print(error.debugDescription)
            }
        }
        
        let asset3Generator = AVAssetImageGenerator(
            asset: AVAsset(url: URL(string: self.video3Url)!))
        asset3Generator.generateCGImagesAsynchronously(forTimes: [startTimeVal]) { (requestedTime, image, actualTime, result, error) in
            if let myImage = image {
                print("got an image")
                DispatchQueue.main.async {
                    self.thumbNail3.image = UIImage(cgImage: myImage)
                }
            } else {
                print(error.debugDescription)
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
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
        self.url = URL(string: self.video1Url)
        performSegue(withIdentifier: "PlayVideo", sender: self)
    }
    
    @IBAction func playVideo2(_ sender: Any) {
        self.url = URL(string: self.video2Url)
        performSegue(withIdentifier: "PlayVideo", sender: self)
    }
    
    @IBAction func playVideo3(_ sender: Any) {
        self.url = URL(string: self.video3Url)
        performSegue(withIdentifier: "PlayVideo", sender: self)
    }
    
}





