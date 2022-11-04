//
//  LocHelpViewController.swift
//  Crisis Management
//
//  Created by Adarsh Goura on 11/4/22.
//

import UIKit

class LocHelpViewController: UIViewController {

    
    @IBSegueAction func inSchoolSegueAction(_ coder: NSCoder) -> ChecklistViewController? {
        return ChecklistViewController(coder: coder, inOrOut: "In School")
    }
    
    @IBSegueAction func outSchoolSegueAction(_ coder: NSCoder) -> ChecklistViewController? {
        return ChecklistViewController(coder: coder, inOrOut: "Out of School")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
