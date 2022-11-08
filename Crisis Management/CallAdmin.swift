//
//  CallAdmin.swift
//  Crisis Management
//
//  Created by Mukund K Raman on 11/7/22.
//

import UIKit

// MARK: - IN SCHOOL

class CallAdminInSchoolController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    /*

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class PrincipalContactsTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class CounselorContactsTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - OUT OF SCHOOL

class CallAdminOutSchoolController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    /*

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class EmergencyContactsTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
