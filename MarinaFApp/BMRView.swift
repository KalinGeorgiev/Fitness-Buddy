//
//  BMRView.swift
//  MarinaFApp
//
//  Created by Student on 2/3/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class BMRView:UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var Gain: UILabel!
    @IBOutlet weak var LoseR: UILabel!
    @IBOutlet weak var ResultBmr: UILabel!
    @IBOutlet weak var GenderInput: UITextField!
    
    @IBOutlet weak var BMI: UITextField!
    @IBOutlet weak var AgeInput: UITextField!
    @IBOutlet weak var Back: UIButton!
    @IBOutlet weak var HeightField: UITextField!
    @IBOutlet weak var WeightInput: UITextField!
    // The sample values
    var values = ["Setendary", "VeryActive", "LightlyActive", "ModeratelyActive","ExtremlyActive"]
    let cellReuseIdentifier = "cell"
    
    
    // Using simple subclass to prevent the copy/paste menu
    // This is optional, and a given app may want a standard UITextField
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func textFieldChanged(_ sender: AnyObject) {
    tableView.isHidden = true
    }
    
    override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    
    tableView.delegate = self
    tableView.dataSource = self
    textField.delegate = self
    
    tableView.isHidden = true
    
    // Manage tableView visibility via TouchDown in textField
    textField.addTarget(self, action: #selector(textFieldActive), for: UIControlEvents.touchDown)
        Back.layer.cornerRadius = 8
        Back.layer.borderWidth = 3
        Back.layer.borderColor = UIColor.orange.cgColor    }
    
    override func viewDidLayoutSubviews()
    {
    // Assumption is we're supporting a small maximum number of entries
    // so will set height constraint to content size
    // Alternatively can set to another size, such as using row heights and setting frame
    
    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    }
    
    // Manage keyboard and tableView visibility
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
    guard let touch:UITouch = touches.first else
    {
    return;
    }
    if touch.view != tableView
    {
    textField.endEditing(true)
    tableView.isHidden = true
    }
    }
    
    // Toggle the tableView visibility when click on textField
    func textFieldActive() {
    tableView.isHidden = !tableView.isHidden
    }
    
    // MARK: UITextFieldDelegate
    func textFieldDidEndEditing(_ textField: UITextField) {
    // TODO: Your app can do something when textField finishes editing
    print("The textField ended editing. Do something based on app requirements.")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
    }
    
    // MARK: UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
    return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return values.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell!
    // Set text from the data model
    cell.textLabel?.text = values[indexPath.row]
    cell.textLabel?.font = textField.font
    return cell
    }
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // Row selected, so set textField to relevant value, hide tableView
    // endEditing can trigger some other action according to requirements
    textField.text = values[indexPath.row]
    tableView.isHidden = true
    textField.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 0.0
    }
    enum Gender {
        case Male
        case Female
    }
    typealias User = (gender: String, age: Int, weightInKg: Double, heightInCm: Int, bodyfat: Double?)
    @IBAction func Button(_ sender: Any) {
        
        var user = User(gender: GenderInput.text!, age: Int(AgeInput.text!)!, weightInKg: Double(WeightInput.text!)!, heightInCm: Int(HeightField.text!)!, bodyfat: Double(BMI.text!)!)
        
        
        
        typealias BMRCalculator = () -> Double
        enum ActivityFactor: Double {
            case Sedentary = 1.2 // Little or no exercise and desk job
            case LightlyActive = 1.375 // Light exercise or sports 1-3 days a week
            case ModeratelyActive = 1.55 // Moderate exercise or sports 3-5 days a week
            case VeryActive = 1.725 // Hard exercise or sports 6-7 days a week4
            case ExtremelyActive = 1.9 // Hard daily exercise or sports and physical job
        }
        
        func TDEE(bmrCalculator: BMRCalculator, activityFactor: ActivityFactor) -> Int {
            return Int(bmrCalculator() * activityFactor.rawValue)
        }
        func lbm(user: User) -> Double {
            return user.weightInKg * (100.0-Double(user.bodyfat!))/100.0
        }
        
        func BMRCalculatorForUser(user: User) -> BMRCalculator {
            func cunninghamCalculator(user: User) -> BMRCalculator {
                return { 500 + 22 * lbm(user: user) }
            }
            
            func mifflinCalculator(user: User) -> BMRCalculator {
                let genderAdjustment = user.gender == "male" ? 161.0 : -5.0
                return { 10.0 * user.weightInKg + 6.25 * Double(user.heightInCm) + genderAdjustment }
            }
            
            if user.bodyfat != nil {
                return cunninghamCalculator(user: user)
            }
            return mifflinCalculator(user: user)
        }
        func caloriesForWeight(kgs: Double) -> Double {
            return kgs * 7700
        }
        ResultBmr.text = "Your BMR is \(TDEE(bmrCalculator: BMRCalculatorForUser(user: user), activityFactor: ActivityFactor.Sedentary))"
        
       LoseR.text = "To lose weight you need daily deficit: \(caloriesForWeight(kgs: 0.5) / 7.0)"

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
