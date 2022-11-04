//
//  ChecklistViewController.swift
//  Crisis Management
//
//  Created by Adarsh Goura on 11/4/22.
//

import UIKit

class ChecklistViewController: UIViewController {

    
    @IBOutlet var settingsButton: UIBarButtonItem!
    @IBOutlet var submitButton: UIButton!
    
    @IBOutlet var check1: UIButton!
    @IBOutlet var check2: UIButton!
    @IBOutlet var check3: UIButton!
    @IBOutlet var check4: UIButton!
    @IBOutlet var check5: UIButton!
    
    @IBOutlet var subtitle: UILabel!
    var inOrOut: String!
    
    init?(coder: NSCoder, inOrOut: String) {
        super.init(coder: coder)
        self.inOrOut = inOrOut
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        check1.setTitle("", for: .normal)
        check2.setTitle("", for: .normal)
        check3.setTitle("", for: .normal)
        check4.setTitle("", for: .normal)
        check5.setTitle("", for: .normal)
        
        subtitle.text = inOrOut

    }
    
    @IBAction func settingsPressed(_ sender: Any) {
        print("Settings button pressed")
        print(subtitle.text!)
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        print("Submit button pressed")
    }
    
    func updateCheckTitle(button check: UIButton) {
        if check.currentTitle == "" {
            check.setTitle("☑️", for: .normal)
        } else {
            check.setTitle("", for: .normal)
        }
    }
    @IBAction func check1Pressed(_ sender: Any) {
        updateCheckTitle(button: check1)
        print("Current title of check 1 is: \"\(check1.currentTitle ?? "nil")\"")
    }
    
    @IBAction func check2Pressed(_ sender: Any) {
            updateCheckTitle(button: check2)
            print("Current title of check 2 is: \"\(check2.currentTitle ?? "nil")\"")
    }
    
    @IBAction func check3Pressed(_ sender: Any) {
        updateCheckTitle(button: check3)
        print("Current title of check 3 is: \"\(check3.currentTitle ?? "nil")\"")
    }
    
    
    @IBAction func check4Pressed(_ sender: Any) {
        updateCheckTitle(button: check4)
        print("Current title of check 4 is: \"\(check4.currentTitle ?? "nil")\"")
    }
    
    
    @IBAction func check5Pressed(_ sender: Any) {
        updateCheckTitle(button: check5)
        print("Current title of check 5 is: \"\(check5.currentTitle ?? "nil")\"")
    }
}
