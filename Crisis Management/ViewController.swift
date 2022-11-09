//
//  ViewController.swift
//  Crisis Management
//
//  Created by Adarsh Goura on 11/1/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Call911Btn: UIButton!
    @IBOutlet weak var ReportBtn: UIButton!
    @IBOutlet weak var ProtocolsBtn: UIButton!
    @IBOutlet weak var CallAdminBtn: UIButton!
    @IBOutlet weak var ResourcesBtn: UIButton!
    @IBOutlet var HomeBtns: [UIButton]!
    @IBOutlet weak var SettingsBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        for btn in HomeBtns {
            roundBtn(radius: 15, btn: btn)
        }
        roundBtn(radius: 15, btn: Call911Btn)
        // Do any additional setup after loading the view.
    }
    
    func roundBtn(radius: Double, btn: UIButton) {
        btn.layer.cornerRadius = CGFloat(radius)
        btn.layer.masksToBounds = true
    }

    @IBAction func Call911(_ sender: Any) {
//        let alertController = UIAlertController(title: "Alert", message: "Are you sure you want to call 911", preferredStyle: .alert)
//        alertController.addAction(UIAlertAction(title: "No", style: .default))
//        alertController.addAction(UIAlertAction(title: "Call", style: .destructive, handler: { (_) in
//            print("911")
//        }))
        print("911")
    }
    
}
