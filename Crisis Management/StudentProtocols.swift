//
//  StudentProtocols.swift
//  Crisis Management
//
//  Created by Adarsh Goura on 11/4/22.
//

import UIKit

class ChecklistViewController: UIViewController, BackTitle {

    @IBOutlet var submitButton: UIButton!
    
    @IBOutlet var check1: UIButton!
    @IBOutlet var check2: UIButton!
    @IBOutlet var check3: UIButton!
    @IBOutlet var check4: UIButton!
    @IBOutlet var check5: UIButton!
    var backTitle: String!
    
    @IBSegueAction func segueAction(_ coder: NSCoder) -> ProtocolsViewController? {
        if check1.title(for: .normal)!.isEmpty && check2.title(for: .normal)!.isEmpty && check3.title(for: .normal)!.isEmpty && check4.title(for: .normal)!.isEmpty && check5.title(for: .normal)!.isEmpty {
            let alertController = UIAlertController(title: "No Criteria Selected", message: "Please check one of the criteria from the checklist", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alertController, animated: true, completion: nil)
        }
        
        return ProtocolsViewController(coder: coder)
    }
    
    @IBOutlet var subtitle: UILabel!
    
    init?(coder: NSCoder, inOrOut: String) {
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backTitle = "Help A Student - Checklist"
        
        if let ctrs = self.navigationController?.viewControllers, ctrs.count > 1 {
            let viewController = ctrs[ctrs.count - 2] as! BackTitle
            let backButton = UIBarButtonItem()
            backButton.title = viewController.backTitle
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }
        
        check1.setTitle("", for: .normal)
        check2.setTitle("", for: .normal)
        check3.setTitle("", for: .normal)
        check4.setTitle("", for: .normal)
        check5.setTitle("", for: .normal)
        
        subtitle.text = InOutSchoolController.insideSchool ? "In School" : "Out of School"

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
    
    @IBAction func check2Pressed(_ sender: UIButton) {
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

class ProtocolsViewController: UIViewController, BackTitle {
    @IBOutlet var inOrOut: UILabel!
    var backTitle: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inOrOut.text = InOutSchoolController.insideSchool ? "In School" : "Out of School"
        self.backTitle = "Help A Student - Protocols"
        
        if let ctrs = self.navigationController?.viewControllers, ctrs.count > 1 {
            let viewController = ctrs[ctrs.count - 2] as! BackTitle
            let backButton = UIBarButtonItem()
            backButton.title = viewController.backTitle
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }
    }
    
    // Goes to Call Recommended people screen

    @IBAction func CallRecommended(_ sender: Any){
         var callAdminController: UIViewController!
        if InOutSchoolController.insideSchool {
            callAdminController = storyboard!.instantiateViewController(withIdentifier: "adminInSchool") as! CallAdminInSchoolController
        } else {
            callAdminController = storyboard!.instantiateViewController(withIdentifier: "adminOutSchool") as! CallAdminOutSchoolController
        }
        self.navigationController?.pushViewController(callAdminController, animated: true)
    }
}
