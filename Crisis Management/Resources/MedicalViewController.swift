//
//  MedicalViewController.swift
//  Student Central v2
//
//  Not created by Yadushan Thillainathan on 2/13/23.
//

import UIKit

class MedicalViewController: UIViewController {
    var worddd : String = ""
    
    @IBOutlet weak var generalButton: UIButton!
    @IBOutlet weak var AIDSHIVButton: UIButton!
    @IBOutlet weak var mentalButton: UIButton!
    @IBOutlet weak var pregnancyButton: UIButton!
    @IBOutlet weak var substanceButton: UIButton!
    
    @IBOutlet var labelStack1: [UIButton]!
    
    
    @IBAction func generalTap(_ sender: Any) {
        worddd = "General Health"
    }
    @IBAction func AIDSHIVTap(_ sender: Any) {
        worddd = "Aids and HIV"
    }
    @IBAction func mentalTap(_ sender: Any) {
        worddd = "Mental Health"
    }
    @IBAction func pregnancyTap(_ sender: Any) {
        worddd = "Pregnancy"
    }
    @IBAction func substanceTap(_ sender: Any) {
        worddd = "Substance Abuse"
    }
    let deviceType = UIDevice.current.model

    override func viewDidLoad() {
        super.viewDidLoad()
        worddd = ""
        if deviceType == "iPhone" {
            // iPhone
            for i in labelStack1 {
                i.titleLabel!.font = .systemFont(ofSize: 14)
            }
        }
        else if deviceType == "iPad" {
            // iPhone
            for i in labelStack1 {
                i.titleLabel!.font = .systemFont(ofSize: 28)
            }
        }
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if let nextViewController = segue.destination as? ViewControllerResPage {
                    nextViewController.order = worddd
                }
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
