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
    
    @IBOutlet weak var issue: UITextField!
    @IBOutlet weak var addInfo: UITextField!
    @IBOutlet var counselorSelect: UIButton!
    @IBOutlet var nameId: UITextField!
    @IBOutlet var roomNum: UITextField!
    @IBOutlet var teacherName: UITextField!
    var counselorText: String! {
        return counselorSelect.titleLabel!.text!
    }
    
    @IBOutlet weak var missing: UILabel!
    var backTitle: String!
    var counselorEmail: String? {
        var email: String = "@coppellisd.com"
        
        if let firstIndex = counselorText.firstIndex(of: " "), counselorText.index(firstIndex, offsetBy: 1) != counselorText.endIndex {
            let startIndex = counselorText.index(firstIndex, offsetBy: 1)
            let endIndex = counselorText.index(counselorText.firstIndex(of: "(")!, offsetBy: -2)
            email = counselorText[startIndex...endIndex].lowercased() + email
            email = counselorText.prefix(1).lowercased() + email
        } else {
            let alertController = UIAlertController(title: "Invalid Counselor Name", message: "Please provide the first and last name of the student's counselor", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alertController, animated: true, completion: nil)
            return nil
        }
        
        return email
    }
    
    func updateColors() {
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

        if(teacherName.text == "") {
            teacherName.backgroundColor = .systemRed
        }
        else {
            teacherName.backgroundColor = .clear
        }

        if(roomNum.text == "") {
            roomNum.backgroundColor = .systemRed
        }
        else {
            roomNum.backgroundColor = .clear
        }

        if(counselorText! == "Tap to select Counselor") {
            counselorSelect.backgroundColor = .systemRed
        }
        else {
            counselorSelect.backgroundColor = .clear
        }
    }
    
    @IBAction func counselorPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func reportButtonClicked(_ sender: UIButton) {
        guard issue.text != "", counselorText != "Tap to select Counselor", nameId.text != "", roomNum.text != "", teacherName.text != "" else {
            missing.text = "Fill Out All Required Fields"
            updateColors()
            return
        }
        
        updateColors()
        missing.text = ""
        if addInfo.text!.isEmpty {
            addInfo.text = "None"
        }
        
        if MFMailComposeViewController.canSendMail() {
            let message = MFMailComposeViewController()
            message.delegate = self
            message.setSubject("Report An Issue")
            
            if let email = counselorEmail {
                message.setToRecipients([email])
                var messageBody: String = "Student Name/ID: \(nameId.text!)\nTeacher Name: \(teacherName.text!)\nStudent's Counselor: \(counselorText!)\nStudent Issue: \(issue.text!)"
                if !ChecklistViewController.situations.isEmpty {
                    messageBody += "\nSituations: "
                    for i in ChecklistViewController.situations {
                        messageBody += "\n * " + i
                    }
                }
                messageBody += "\nRoom Number: \(roomNum.text!)\nAdditional Information: \(addInfo.text!)"
                
                message.setMessageBody(messageBody, isHTML: false)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backTitle = "Report An Issue"
        counselorSelect.showsMenuAsPrimaryAction = true
        counselorSelect.changesSelectionAsPrimaryAction = true
        
        let placeholderClosure = {(action: UIAction) in
            self.counselorSelect.setTitleColor(.systemGray3, for: .normal)
            return
        }
        let optionClosure = {(action: UIAction) in
            self.counselorSelect.setTitleColor(.black, for: .normal)
            return
        }
        
        
        counselorSelect.menu = UIMenu(children: [
            UIAction(title: "Tap to select Counselor", state: .on, handler: placeholderClosure),
                UIAction(title: "N/A", handler: optionClosure),
//                UIAction(title: "Cheryl Abreu (A - Cham)", handler: optionClosure),
//                UIAction(title: "Laura McMillin (Chan - Gox)", handler: optionClosure),
//                UIAction(title: "Michael Kennington (Goy - Kiv)", handler: optionClosure),
//                UIAction(title: "Heather Crumpton (Kiw - Nah)", handler: optionClosure),
//                UIAction(title: "Lindsey Oh (Nal - Roc)", handler: optionClosure),
//                UIAction(title: "Ann Cinelli (Rod - Som)", handler: optionClosure),
//                UIAction(title: "Keith Tremethick (Son - Z)", handler: optionClosure),
            ])
        
        if let ctrs = self.navigationController?.viewControllers, ctrs.count > 1 {
            let viewController = ctrs[ctrs.count - 2] as! BackTitle
            let backButton = UIBarButtonItem()
            backButton.title = viewController.backTitle
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }

        // Do any additional setup after loading the view.
        inOrOut.text = InOutSchoolController.insideSchool ? "In School" : "Out of School"
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        print("Hello")
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height-4*nameId.frame.height

            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

}

