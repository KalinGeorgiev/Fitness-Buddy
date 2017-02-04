//
//  TransitionTraining.swift
//  MarinaFApp
//
//  Created by Student on 2/4/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class TransitionTraining: UIViewController{
    @IBOutlet weak var infoButton: UIButton!

    @IBOutlet weak var Balloon5: UIImageView!
    @IBOutlet weak var Balloon4: UIImageView!
    @IBOutlet weak var Balloon2: UIImageView!
    @IBOutlet weak var Balloon3: UIImageView!
    @IBOutlet weak var Balloon1: UIImageView!
    @IBOutlet weak var gymButton: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoButton.layer.masksToBounds = true
        infoButton.backgroundColor = .clear
        infoButton.layer.cornerRadius = 8
        infoButton.layer.borderWidth = 3
        infoButton.layer.borderColor = UIColor.orange.cgColor
        gymButton.layer.masksToBounds = true
        gymButton.backgroundColor = .clear
        gymButton.layer.cornerRadius = 8
        gymButton.layer.borderWidth = 3
        gymButton.layer.borderColor = UIColor.orange.cgColor
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        Balloon1.center.y -= view.bounds.height
        Balloon2.center.y -= view.bounds.height
        Balloon3.center.y -= view.bounds.height
        Balloon4.center.y -= view.bounds.height
        Balloon5.center.y -= view.bounds.height
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
       
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
        UIView.animate(withDuration:15,delay: 0, options: [.repeat],
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
    }
}
