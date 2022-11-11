//
//  SettingsController.swift
//  Crisis Management
//
//  Created by Mukund Raman on 11/7/22.
//

import UIKit

class SettingsController: UITableViewController {
    var myIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        myIndex = indexPath.row
        
        if (myIndex == 4){
            guard let url = URL(string: "https://forms.gle/XVt2PCnT6WnN1ngb8") else {
                return
            }
            UIApplication.shared.open(url)
        }
        
        
        //performSegue(withIdentifier: "resIden", sender: self)
    }
    
}

class PrivacyNoticeController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // ...
}



//func feedback(_ sender: UIButton) {
//    guard let url = URL(string: "https://www.google.com") else {
//        return
//    }
//    let message = SFSafariViewController(url: url)
//    present(message, animated: true)
//}
