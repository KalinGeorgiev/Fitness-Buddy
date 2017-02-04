//
//  FourthViewController.swift
//  MarinaFApp
//
//  Created by Student on 2/4/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class FourthViewController: UIViewController {
  
    
    var playerController = AVPlayerViewController()
    var playerController1 = AVPlayerViewController()
    var playerController2 = AVPlayerViewController()
    var playerController3 = AVPlayerViewController()
    var playerController4 = AVPlayerViewController()
    var player:AVPlayer?
    var player1:AVPlayer?
    var player2:AVPlayer?
    var player3:AVPlayer?
    var player4:AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let videoString:String? = Bundle.main.path(forResource: "video-1486160864", ofType: ".mp4")
        
        let videoString1:String? = Bundle.main.path(forResource: "video-1486160869", ofType: ".mp4")
        
        let videoString2:String? = Bundle.main.path(forResource: "video-1486160925", ofType: ".mp4")
        
        let videoString3:String? = Bundle.main.path(forResource: "video-1486160938", ofType: ".mp4")
        
        let videoString4:String? = Bundle.main.path(forResource: "video-1486160942", ofType: ".mp4")
        
        if let url = videoString {
            
            let videoURL = NSURL(fileURLWithPath: url)
            self.player = AVPlayer(url: videoURL as URL)
            self.playerController.player = self.player
        }
        
        if let url1 = videoString1 {
            
            let videoURL = NSURL(fileURLWithPath: url1)
            self.player1 = AVPlayer(url: videoURL as URL)
            self.playerController1.player = self.player1
        }
        
        if let url2 = videoString2 {
            
            let videoURL = NSURL(fileURLWithPath: url2)
            self.player2 = AVPlayer(url: videoURL as URL)
            self.playerController2.player = self.player2
        }
        
        if let url3 = videoString3 {
            
            let videoURL = NSURL(fileURLWithPath: url3)
            self.player3 = AVPlayer(url: videoURL as URL)
            self.playerController3.player = self.player3
        }
        
        if let url4 = videoString4 {
            
            let videoURL = NSURL(fileURLWithPath: url4)
            self.player4 = AVPlayer(url: videoURL as URL)
            self.playerController4.player = self.player4
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func Play(_ sender: Any) {
        
        self.present(self.playerController, animated: true, completion: {
            self.playerController.player?.play()
        })
    }
    

    @IBAction func Play1(_ sender: Any) {
        
        self.present(self.playerController1, animated: true, completion: {
            self.playerController1.player?.play()
        })
    }
    
    
    @IBAction func Play2(_ sender: Any) {
        
        self.present(self.playerController2, animated: true, completion: {
            self.playerController2.player?.play()
        })    }
    
    
    @IBAction func Play3(_ sender: Any) {
        
        self.present(self.playerController3, animated: true, completion: {
            self.playerController3.player?.play()
        })    }
    
    
    @IBAction func Play4(_ sender: Any) {
        
        self.present(self.playerController4, animated: true, completion: {
            self.playerController4.player?.play()
        })    }

}
