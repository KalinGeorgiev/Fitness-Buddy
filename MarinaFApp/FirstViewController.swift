//
//  FirstViewController.swift
//  MarinaFApp
//
//  Created by Student on 2/2/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    
    @IBOutlet weak var Back: UIButton!
    @IBOutlet weak var BMILabel: UILabel!
    @IBOutlet weak var WeightInput: UITextField!
    @IBOutlet weak var HeightInput: UITextField!
    @IBOutlet weak var Severe: UIImageView!
    @IBOutlet weak var OverWeight: UIImageView!
    @IBOutlet weak var Healthy: UIImageView!
    @IBOutlet weak var BMIView: UIImageView!
    @IBOutlet weak var Obesity: UIImageView!
    @IBOutlet weak var UnderWeight: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Back.layer.cornerRadius = 8
        Back.layer.borderWidth = 3
        Back.layer.borderColor = UIColor.orange.cgColor        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // Variables
    private var imageViewShowing: Bool = false
    // View life cycle
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.Healthy.isHidden = true
        self.OverWeight.isHidden = true
        self.UnderWeight.isHidden = true
        self.Severe.isHidden = true
        self.Obesity.isHidden = true
    }
    
    @IBAction func CalculateBMI(_ sender: Any) {
        let total: Double = Double(WeightInput.text!)!/(Double(HeightInput.text!)!*(Double(HeightInput.text!)!))
        BMILabel.text="\(total)"
        if (self.imageViewShowing) {
            // Hide
            UIView.transition(from: self.Healthy, to: self.BMIView, duration: 0.5, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
            
        }
        if(self.imageViewShowing){
            UIView.transition(from: self.OverWeight, to: self.BMIView, duration: 0.5, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
            
        }
        if(self.imageViewShowing){
            UIView.transition(from: self.UnderWeight, to: self.BMIView, duration: 0.5, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
        if(self.imageViewShowing){
            UIView.transition(from: self.Severe, to: self.BMIView, duration: 0.5, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
        if(self.imageViewShowing){
            UIView.transition(from: self.Obesity, to: self.BMIView, duration: 0.5, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
            
        else {
            if (total>18&&total<24){
                // Show
                UIView.transition(from: self.BMIView, to: self.Healthy, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
            }
            else if (total<18){
                // Show
                UIView.transition(from: self.BMIView, to: self.UnderWeight, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
                
            }
            else if (total>24&&total<29){
                // Show
                UIView.transition(from: self.BMIView, to: self.OverWeight, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
            }
            else if (total>35&&total<39.9){
                // Show
                UIView.transition(from: self.BMIView, to: self.Obesity, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
            }
            else if (total>40){
                // Show
                UIView.transition(from: self.BMIView, to: self.Severe, duration: 0.5, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
                
            }
            self.imageViewShowing = !self.imageViewShowing
}
    }
}
