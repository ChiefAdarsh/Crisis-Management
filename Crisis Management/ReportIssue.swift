//
//  ReportIssue.swift
//  Crisis Management
//
//  Created by Mukund K Raman on 11/7/22.
//

import UIKit
import SafariServices
import MessageUI

class ReportIssueController: UIViewController, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var nameId: UITextField!
    @IBOutlet weak var issue: UITextField!
    @IBOutlet weak var counselor: UITextField!
    @IBOutlet weak var addInfo: UITextField!
    
    @IBOutlet weak var missing: UILabel!
    
    
    @IBAction func reportButtonClicked(_ sender: UIButton) {
        guard nameId.text != "", counselor.text != "", issue.text != "" else {
            missing.text = "FILL OUT ALL REQUIRED FEILDS"
            if(nameId.text == "") {
                nameId.backgroundColor = .systemRed
            }
            else{
                nameId.backgroundColor = .clear
            }
            if(issue.text == "") {
                issue.backgroundColor = .systemRed
            }
            else{
                issue.backgroundColor = .clear
            }
            if(counselor.text == "") {
                counselor.backgroundColor = .systemRed
            }
            else{
                counselor.backgroundColor = .clear
            }
            return
        }
        if MFMailComposeViewController.canSendMail(){
            let message = MFMailComposeViewController()
            message.delegate = self
            message.setSubject("Report An Issue")
            var email = ""
            message.setToRecipients([email])
            message.setMessageBody("Student Name: \(nameId) \n Student ID: \(counselor) \n Student's Counselor: \(issue) \n Additional Information: \(addInfo)", isHTML: false)
            present(UINavigationController(rootViewController: message), animated: true)
        }
        else {
            guard let url = URL(string: "https://www.google.com") else {
                return
            }
            let message = SFSafariViewController(url: url)
            present(message, animated: true)
        }
    }
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    /* Variables from Interface Builder */
    
    @IBOutlet var inOrOut: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        inOrOut.text = InOutSchoolController.insideSchool ? "In School" : "Out of School"
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

