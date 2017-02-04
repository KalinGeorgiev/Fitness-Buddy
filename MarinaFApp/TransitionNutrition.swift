//
//  TransitionNutrition.swift
//  MarinaFApp
//
//  Created by Student on 2/3/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class TransitionNutrition: UIViewController {
    @IBOutlet weak var Balloon1: UIImageView!
@IBOutlet weak var Balloon5: UIImageView!
        @IBOutlet weak var Balloon4: UIImageView!
        @IBOutlet weak var Balloon3: UIImageView!
    @IBOutlet weak var Balloon6: UIImageView!

    @IBOutlet weak var bmiButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
   @IBOutlet weak var Balloon2: UIImageView!
    override func viewDidLoad() {
                super.viewDidLoad()
        
        infoButton.layer.masksToBounds = true
        infoButton.backgroundColor = .clear
        infoButton.layer.cornerRadius = 8
        infoButton.layer.borderWidth = 3
        infoButton.layer.borderColor = UIColor.orange.cgColor
        bmiButton.layer.masksToBounds = true
        bmiButton.backgroundColor = .clear
        bmiButton.layer.cornerRadius = 8
        bmiButton.layer.borderWidth = 3
        bmiButton.layer.borderColor = UIColor.orange.cgColor
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        infoButton.center.x-=view.bounds.width
        bmiButton.center.x-=view.bounds.width
        Balloon1.center.y -= view.bounds.height
        Balloon2.center.y -= view.bounds.height
        Balloon3.center.y -= view.bounds.height
        Balloon4.center.y -= view.bounds.height
        Balloon5.center.y -= view.bounds.height
        Balloon6.center.y -= view.bounds.height
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1) {
            self.bmiButton.center.x += self.view.bounds.width
        }
        UIView.animate(withDuration: 1) {
            self.infoButton.center.x += self.view.bounds.width
        }
        UIView.animate(withDuration:10,delay: 0, options: [.repeat],
                       animations: {
                        self.Balloon1.center.y += self.view.bounds.height*3
        },
                       completion: nil
        )
        UIView.animate(withDuration: 12,delay: 0, options: [.repeat],
                       animations: {
                        self.Balloon2.center.y += self.view.bounds.height*2
        },
                       completion: nil
        )
        UIView.animate(withDuration:8,delay: 0.1, options: [.repeat],
                       animations: {
                        self.Balloon3.center.y += self.view.bounds.height*3
        },
                       completion: nil
        )
        UIView.animate(withDuration: 14,delay: 0.2, options: [.repeat],
                       animations: {
                        self.Balloon4.center.y += self.view.bounds.height*2
        },
                       completion: nil
        )
        
        UIView.animate(withDuration: 13,delay: 0, options: [.repeat],
                       animations: {
                        self.Balloon5.center.y += self.view.bounds.height*2
        },
                       completion: nil
        )
        UIView.animate(withDuration: 7,delay: 0.6, options: [.repeat],
                       animations: {
                        self.Balloon6.center.y += self.view.bounds.height*2
        },
                       completion: nil
        )
        
    }
    

}
