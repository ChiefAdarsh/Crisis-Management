//
//  ReportIssue.swift
//  Crisis Management
//
//  Created by Mukund K Raman on 11/7/22.
//

import UIKit
import SafariServices
import MessageUI

class ReportIssueController: UIViewController, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate, BackTitle {
    
    @IBOutlet weak var nameId: UITextField!
    @IBOutlet weak var issue: UITextField!
    @IBOutlet weak var counselor: UITextField!
    @IBOutlet weak var addInfo: UITextField!
    @IBOutlet var counselorSelect: UIButton!
    
    @IBOutlet weak var missing: UILabel!
    var backTitle: String!
    var counselorEmail: String? {
        let str: String = counselor.text!
        var email: String = "@coppellisd.com"
        
        if let firstIndex = str.firstIndex(of: " "), str.index(firstIndex, offsetBy: 1) != str.endIndex {
            let startIndex = str.index(firstIndex, offsetBy: 1)
            email = str[startIndex...str.index(str.endIndex, offsetBy: -1)].lowercased() + email
            email = str.prefix(1).lowercased() + email
        } else {
            let alertController = UIAlertController(title: "Invalid Counselor Name", message: "Please provide the first and last name of the student's counselor", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alertController, animated: true, completion: nil)
            return nil
        }
        
        return email
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backTitle = "Report An Issue"
        counselorSelect.showsMenuAsPrimaryAction = true
        
        counselorSelect.showsMenuAsPrimaryAction = true
        counselorSelect.changesSelectionAsPrimaryAction = true
            
            let optionClosure = {(action: UIAction) in
                
//                if ((action.index(ofAccessibilityElement: (Any).self)) != 0)
            }
            
        counselorSelect.menu = UIMenu(children: [
            UIAction(title: "Tap to select Counselor", state: .on, handler: optionClosure),
                UIAction(title: "Cheryl Abreu (A - Cham)", handler: optionClosure),
                UIAction(title: "Laura McMillin (Cham - Gow)", handler: optionClosure),
                UIAction(title: "Michael Kennington (Goy - Kiv)", handler: optionClosure),
                UIAction(title: "Kelly Guevara (Kiw - Nai)", handler: optionClosure),
                UIAction(title: "Lindsey Oh (Nah - Roc)", handler: optionClosure),
                UIAction(title: "Ann Cinelli (Rod - Som)", handler: optionClosure),
                UIAction(title: "Keith Tremethick (Son - Z)", handler: optionClosure),
            ])
        
        if let ctrs = self.navigationController?.viewControllers, ctrs.count > 1 {
            let viewController = ctrs[ctrs.count - 2] as! BackTitle
            let backButton = UIBarButtonItem()
            backButton.title = viewController.backTitle
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }

        // Do any additional setup after loading the view.
        inOrOut.text = InOutSchoolController.insideSchool ? "In School" : "Out of School"
    }
    
    @IBAction func counselorPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func reportButtonClicked(_ sender: UIButton) {
        guard nameId.text != "", counselor.text != "", issue.text != "" else {
            missing.text = "Fill Out All Required Fields"
            if(nameId.text == "") {
                nameId.backgroundColor = .systemRed
            }
            else {
                nameId.backgroundColor = .clear
            }
            if(issue.text == "") {
                issue.backgroundColor = .systemRed
            }
            else {
                issue.backgroundColor = .clear
            }
            if(counselor.text == "") {
                counselor.backgroundColor = .systemRed
            }
            else {
                counselor.backgroundColor = .clear
            }
            return
        }
        
        if addInfo.text!.isEmpty {
            addInfo.text = "None"
        }
        
        if MFMailComposeViewController.canSendMail() {
            let message = MFMailComposeViewController()
            message.delegate = self
            message.setSubject("Report An Issue")
            
            if let email = counselorEmail {
                message.setToRecipients([email])
                message.setMessageBody("Student Name/ID: \(nameId.text!) \n Student's Counselor': \(counselor.text!) \n Additional Information: \(addInfo.text!)", isHTML: false)
                present(message, animated: true)
            }
        } else {
            let alertController = UIAlertController(title: "Mail Not Enabled", message: "Your device is not configured to send email", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    /* Variables from Interface Builder */
    
    @IBOutlet var inOrOut: UILabel!

}

