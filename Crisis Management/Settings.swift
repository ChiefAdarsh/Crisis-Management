//
//  SettingsController.swift
//  Crisis Management
//
//  Created by Mukund Raman on 11/7/22.
//

import UIKit

class SettingsController: UITableViewController, BackTitle {
    var backTitle: String!
    var myIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backTitle = "Settings"
        
        if let ctrs = self.navigationController?.viewControllers, ctrs.count > 1 {
            let viewController = ctrs[ctrs.count - 2] as! BackTitle
            let backButton = UIBarButtonItem()
            backButton.title = viewController.backTitle
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        myIndex = indexPath.row
        
        if (myIndex == 2){
            guard let url = URL(string: "https://forms.gle/XVt2PCnT6WnN1ngb8") else {
                return
            }
            UIApplication.shared.open(url)
        }
    }
    
}

class PrivacyNoticeController: UIViewController, BackTitle {
    var backTitle: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backTitle = "Privacy Policy"
        
        if let ctrs = self.navigationController?.viewControllers, ctrs.count > 1 {
            let viewController = ctrs[ctrs.count - 2] as! BackTitle
            let backButton = UIBarButtonItem()
            backButton.title = viewController.backTitle
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }
    }
    
    // ...
}

class AboutController: UIViewController, BackTitle {
    var backTitle: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backTitle = "About"
        
        if let ctrs = self.navigationController?.viewControllers, ctrs.count > 1 {
            let viewController = ctrs[ctrs.count - 2] as! BackTitle
            let backButton = UIBarButtonItem()
            backButton.title = viewController.backTitle
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }
    }
    
    // ...
}
