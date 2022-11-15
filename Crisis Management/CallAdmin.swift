//
//  CallAdmin.swift
//  Crisis Management
//
//  Created by Mukund K Raman on 11/7/22.
//

import UIKit

// MARK: - IN SCHOOL

class CallAdminInSchoolController: UIViewController, BackTitle {
    var backTitle: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backTitle = "Call Admin"
        
        if let ctrs = self.navigationController?.viewControllers, ctrs.count > 1 {
            let viewController = ctrs[ctrs.count - 2] as! BackTitle
            let backButton = UIBarButtonItem()
            backButton.title = viewController.backTitle
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
}

class PrincipalContactsTableViewController: UITableViewController, BackTitle {
    var backTitle: String!
    
    override func viewDidLoad() {
        createAdmins()
        super.viewDidLoad()
        self.backTitle = "Principals"
        
        if let ctrs = self.navigationController?.viewControllers, ctrs.count > 1 {
            let viewController = ctrs[ctrs.count - 2] as! BackTitle
            let backButton = UIBarButtonItem()
            backButton.title = viewController.backTitle
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return principalList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PrincipalCell", for: indexPath)

        // Configure the cell...

        let label = cell.viewWithTag(1000) as! UILabel
        let image = cell.viewWithTag(1234) as! UIImageView
        let subtitle = cell.viewWithTag(2468) as! UILabel
        
        for i in 0...(principalList.count - 1) {
            if indexPath.row == i {
                label.text = principalList[i].fullName
                image.image = UIImage(named: principalList[i].imgStr!)
                subtitle.text = principalList[i].adminTypeDetailed
                cell.accessoryType = .disclosureIndicator
            }
        }
        // End of new code block
        return cell
    }
    
    override func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
        
        for i in 0...(principalList.count - 1) {
            if indexPath[1] == i {
                selectedAdmin = principalList[i]
                print(selectedAdmin.fullName)
                let prinViewController = storyboard!.instantiateViewController(withIdentifier: "adminInfoInSchool") as! AdminInfoViewController
                self.navigationController?.pushViewController(prinViewController, animated: true)
            }
        }
    }
}

class CounselorContactsTableViewController: UITableViewController, BackTitle {
    var backTitle: String!
    
    override func viewDidLoad() {
        createAdmins()
        super.viewDidLoad()
        self.backTitle = "Counselors"
        
        if let ctrs = self.navigationController?.viewControllers, ctrs.count > 1 {
            let viewController = ctrs[ctrs.count - 2] as! BackTitle
            let backButton = UIBarButtonItem()
            backButton.title = viewController.backTitle
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return counselorList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CounselorCell", for: indexPath)

        // Configure the cell...

        let label = cell.viewWithTag(2000) as! UILabel
        let image = cell.viewWithTag(1357) as! UIImageView
        let subtitle = cell.viewWithTag(1111) as! UILabel
        
        for i in 0...(counselorList.count - 1) {
            if indexPath.row == i {
                label.text = counselorList[i].fullName
                image.image = UIImage(named: counselorList[i].imgStr!)
                subtitle.text = counselorList[i].adminTypeDetailed
                cell.accessoryType = .disclosureIndicator
            }
        }
        // End of new code block
        return cell
    }
    
    override func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
        
        for i in 0...(counselorList.count - 1) {
            if indexPath[1] == i {
                selectedAdmin = counselorList[i]
                print(selectedAdmin.fullName)
                let counViewController = storyboard!.instantiateViewController(withIdentifier: "adminInfoInSchool") as! AdminInfoViewController
                self.navigationController?.pushViewController(counViewController, animated: true)
            }
        }
    }
}

class AdminInfoViewController: UIViewController, BackTitle {
    var backTitle: String!
    
    @IBOutlet var EmailBtn: UIButton!
    @IBOutlet var CallBtn: UIButton!
    @IBOutlet var AdminLbl: UILabel!
    @IBOutlet var AdminPic: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backTitle = selectedAdmin.fullName
        
        if let ctrs = self.navigationController?.viewControllers, ctrs.count > 1 {
            let viewController = ctrs[ctrs.count - 2] as! BackTitle
            let backButton = UIBarButtonItem()
            backButton.title = viewController.backTitle
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }
        
        AdminLbl.text = "\(selectedAdmin.fullName), \(selectedAdmin.adminTypeDetailed)"
        AdminPic.image = UIImage(named: selectedAdmin.imgStr!)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func call(_ sender: Any) {
        if let url = NSURL(string: "https://teams.microsoft.com/l/call/0/0?users=myakubovsky@coppellisd.com"){
            UIApplication.shared.open(url as URL)
        }
    }
    
    @IBAction func email(_ sender: Any) {
        let email = selectedAdmin.email
        if let url = URL(string: "mailto:\(email)") {
          if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
          } else {
            UIApplication.shared.openURL(url)
          }
        }
    }
}

// MARK: - OUT OF SCHOOL

class CallAdminOutSchoolController: UIViewController, BackTitle {
    var backTitle: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backTitle = "Call Admin"
        
        if let ctrs = self.navigationController?.viewControllers, ctrs.count > 1 {
            let viewController = ctrs[ctrs.count - 2] as! BackTitle
            let backButton = UIBarButtonItem()
            backButton.title = viewController.backTitle
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
}

class EmergencyContactsTableViewController: UITableViewController, BackTitle {
    var backTitle: String!
    
    override func viewDidLoad() {
        createAdmins()
        super.viewDidLoad()
        self.backTitle = "Emergency Contacts"
        
        if let ctrs = self.navigationController?.viewControllers, ctrs.count > 1 {
            let viewController = ctrs[ctrs.count - 2] as! BackTitle
            let backButton = UIBarButtonItem()
            backButton.title = viewController.backTitle
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return emergencyContactsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmergencyCell", for: indexPath)

        // Configure the cell...

        let label = cell.viewWithTag(3000) as! UILabel
        
        for i in 0...(emergencyContactsList.count - 1) {
            if indexPath.row == i {
                label.text = emergencyContactsList[i]
                if emergencyContactsList[i].contains(":") {
                    
                }
                cell.accessoryType = .disclosureIndicator
            }
        }
        // End of new code block
        return cell
    }
    
    override func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
        
        for i in 0...(counselorList.count - 1) {
            if indexPath[1] == i {
                switch i {
                case 0:
                    selectedAdmin = findAdmin(username: "lspringer")
                    var adminViewController = storyboard!.instantiateViewController(withIdentifier: "adminInfoInSchool") as! AdminInfoViewController
                    self.navigationController?.pushViewController(adminViewController, animated: true)
                case 1:
                    selectedAdmin = findAdmin(username: "marnold")
                    var adminViewController = storyboard!.instantiateViewController(withIdentifier: "adminInfoInSchool") as! AdminInfoViewController
                    self.navigationController?.pushViewController(adminViewController, animated: true)
                case 2:
                    selectedAdmin = findAdmin(username: "acinelli")
                    var adminViewController = storyboard!.instantiateViewController(withIdentifier: "adminInfoInSchool") as! AdminInfoViewController
                    self.navigationController?.pushViewController(adminViewController, animated: true)
                default:
                    print("Nothing would happen")
                }
            }
        }
    }
}

var numberStart = "214496"

var adminList: [Admin] = []
var principalList: [Admin] = []
var counselorList: [Admin] = []
var emergencyContactsList: [String] = ["Principal: Laura Springer                      6110", "Associate Principal: Melissa Arnold    6122", "Lead Counselor: Ann Cinelli                 6112", "Coppell Police Department                 972-304-3600", "Dallas Police Department                    214-744-4444", "Irving Police Department                     972-723-1010", "Lewisville Police Department              972-219-3600", "Child Protective Services                     800-252-5400", "Dallas County Mobile Crisis                 866-260-8000"]

var selectedAdmin: Admin = Admin(imgStr: "", adminType: AdminType.Counselor, lastName: "", firstName: "", username: "", callExt: 0, adminTypeDetailed: "")

enum AdminType {
    case Principal
    case Counselor
}

class Admin {
    
    var adminType: AdminType
    var adminTypeDetailed: String
    var lastName: String
    var firstName: String
    var username: String
    var callExt: Int
    var imgStr: String?
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    var number: Int {
        return Int(numberStart + String(callExt))!
    }
    
    var email: String {
        return username + "@coppellisd.com"
    }
    
    var callLink: String {
        return "https://teams.microsoft.com/l/call/0/0?users=\(email)"
    }
    
    init(imgStr: String?, adminType: AdminType, lastName: String, firstName: String, username: String, callExt: Int, adminTypeDetailed: String) {
        self.adminType = adminType
        self.lastName = lastName
        self.firstName = firstName
        self.username = username
        self.callExt = callExt
        self.adminTypeDetailed = adminTypeDetailed
        if imgStr != nil {
            self.imgStr = imgStr!
        } else {
            self.imgStr = "Blank_crop"
        }
    }
    
}

func createAdmins() {
    
    adminList.removeAll()
    principalList.removeAll()
    counselorList.removeAll()
    
    // PRINCIPALS

    var admin = Admin(imgStr: "Springer_crop", adminType: AdminType.Principal, lastName: "Springer", firstName: "Laura", username: "lspringer", callExt: 6104, adminTypeDetailed: "Principal")
    adminList.append(admin)

    admin = Admin(imgStr: "Arnold_crop", adminType: AdminType.Principal, lastName: "Arnold", firstName: "Melissa", username: "marnold", callExt: 6122, adminTypeDetailed: "Associate Principal")
    adminList.append(admin)

    admin = Admin(imgStr: "Rix_crop", adminType: AdminType.Principal, lastName: "Rix", firstName: "Aylor", username: "arix", callExt: 6124, adminTypeDetailed: "Assistant Principal (A-C)")
    adminList.append(admin)

    admin = Admin(imgStr: "Osborne_crop", adminType: AdminType.Principal, lastName: "Osborne", firstName: "Cindi", username: "cosborne", callExt: 6126, adminTypeDetailed: "Assistant Principal (D-J)")
    adminList.append(admin)

    admin = Admin(imgStr: "Gollner_crop", adminType: AdminType.Principal, lastName: "Gollner", firstName: "Chris", username: "cgollner", callExt: 6123, adminTypeDetailed: "Assistant Principal (K-M)")
    adminList.append(admin)

    admin = Admin(imgStr: "Porter_crop", adminType: AdminType.Principal, lastName: "Porter", firstName: "Zane", username: "zporter", callExt: 0, adminTypeDetailed: "Assistant Principal (N-Sf)")
    adminList.append(admin)

    admin = Admin(imgStr: "Girard_crop", adminType: AdminType.Principal, lastName: "Girard", firstName: "Brandon", username: "bgirard", callExt: 0, adminTypeDetailed: "Assistant Principal (Sg-Z)")
    adminList.append(admin)
    
    admin = Admin(imgStr: nil, adminType: AdminType.Principal, lastName: "Yakubovsky", firstName: "Michael", username: "myakubovsky", callExt: 6237, adminTypeDetailed: "STEM Teacher")
    adminList.append(admin)

    // COUNSELORS

    admin = Admin(imgStr: "Cinelli_crop", adminType: AdminType.Counselor, lastName: "Cinelli", firstName: "Ann", username: "acinelli", callExt: 6112, adminTypeDetailed: "Lead Counselor (Rod-Som)")
    adminList.append(admin)

    admin = Admin(imgStr: "Abreu_crop", adminType: AdminType.Counselor, lastName: "Abreu", firstName: "Cheryl", username: "cabreu", callExt: 6132, adminTypeDetailed: "Counselor (A-Cham)")
    adminList.append(admin)

    admin = Admin(imgStr: "McMillin_crop", adminType: AdminType.Counselor, lastName: "McMillin", firstName: "Laura", username: "lmcmillin", callExt: 6106, adminTypeDetailed: "Counselor (Chan-Gox)")
    adminList.append(admin)

    admin = Admin(imgStr: "Kennington_crop", adminType: AdminType.Counselor, lastName: "Kennington", firstName: "Michael", username: "mkennington", callExt: 6133, adminTypeDetailed: "Counselor (Goy-Kiv)")
    adminList.append(admin)

    admin = Admin(imgStr: "Oh_crop", adminType: AdminType.Counselor, lastName: "Oh", firstName: "Lindsey", username: "loh", callExt: 6136, adminTypeDetailed: "Counselor (Nal-Roc)")
    adminList.append(admin)

    admin = Admin(imgStr: "Tremethick_crop", adminType: AdminType.Counselor, lastName: "Tremethick", firstName: "Keith", username: "ktremethick", callExt: 6131, adminTypeDetailed: "Counselor (Son-Z)")
    adminList.append(admin)

    admin = Admin(imgStr: "Crumpton_crop", adminType: AdminType.Counselor, lastName: "Crumpton", firstName: "Heather", username: "hcrumpton", callExt: 6135, adminTypeDetailed: "Counselor (Kiw-Nah)")
    adminList.append(admin)

    // Sort
    
    for admin in adminList {
        if admin.adminType == AdminType.Principal {
//            print("Principal \(admin.fullName)")
            principalList.append(admin)
        } else if admin.adminType == AdminType.Counselor {
//            print("Counselor \(admin.fullName)")
            counselorList.append(admin)
        } else {
            print(admin.fullName)
        }
    }

}

func findAdmin(username: String) -> Admin {
    createAdmins()
    for admin in adminList {
        if admin.username == username {
            return admin
        }
    }
    return Admin(imgStr: "AA", adminType: AdminType.Counselor, lastName: "NA", firstName: "NA", username: "NA", callExt: 0, adminTypeDetailed: "NA")
}
