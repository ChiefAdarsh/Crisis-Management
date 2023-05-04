//
//  CallAdmin.swift
//  Crisis Management
//
//  Not created by Varshith Peddi on 11/7/22.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers

// MARK: - IN SCHOOL

class CallAdminInSchoolController: UIViewController, BackTitle, UIDocumentPickerDelegate {
    @IBOutlet var uploadBtn: UIButton!
    var txtString: String!
    var backTitle: String!
    let documentPicker = UIDocumentPickerViewController(documentTypes: ["public.text"], in: .import)
    var archiveURLs: [URL] = []
    lazy var numAdminURL: URL = documentsDirectory.appendingPathComponent("numAdmin")
        .appendingPathExtension("plist")
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask).first!
    var numOfAdmins: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backTitle = "Call Admin"
        documentPicker.delegate = self
        
        if let ctrs = self.navigationController?.viewControllers, ctrs.count > 1 {
            let viewController = ctrs[ctrs.count - 2] as! BackTitle
            let backButton = UIBarButtonItem()
            backButton.title = viewController.backTitle
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }
        
        let jsonDecoder = JSONDecoder()
        if let retrievedData = try? Data(contentsOf: numAdminURL),
            let decodedData = try?
           jsonDecoder.decode(numAdmin.self,
           from: retrievedData) {
            print(decodedData)
            numOfAdmins = decodedData.numOfAdmins
        }
        
        for i in 0..<numOfAdmins {
            archiveURLs.append(documentsDirectory.appendingPathComponent("admin\(i + 1)")
               .appendingPathExtension("plist"))
        }
        
        for i in 0..<numOfAdmins {
            let jsonDecoder = JSONDecoder()
            if let retrievedData = try? Data(contentsOf: archiveURLs[i]),
                let decodedData = try?
               jsonDecoder.decode(Admin.self,
               from: retrievedData) {
                print(decodedData)
                let adminType = decodedData.adminType
                adminList.append(decodedData)
                
                if adminType == "p" {
                    principalList.append(decodedData)
                } else {
                    counselorList.append(decodedData)
                }
                
//                teacherLabels[i]!.text = decodedData.name
//                teacherMails[i]!.text = decodedData.email
            }
        }
    }
    
    @IBAction func upload(_ sender: Any) {
        let documentPicker = UIDocumentPickerViewController(documentTypes: ["public.text"], in: .import)
        documentPicker.delegate = self
        present(documentPicker, animated: true)
    }
    
    struct numAdmin : Codable {
        var numOfAdmins: Int
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        print("hi")
        adminList.removeAll()
        
        do {
            let txtData = try Data(contentsOf: urls[0])
            
            //10. Convert the data to a string
            txtString = String(data: txtData, encoding: .utf8)
            print(txtString!)
        } catch {
            print("o no")
        }
        numOfAdmins = txtString.numberOfLines / 7
        let numAdmin = numAdmin(numOfAdmins: numOfAdmins)
        
        let jsonEncoder = JSONEncoder()
        if let jsonData = try? jsonEncoder.encode(numAdmin),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)

            try? jsonData.write(to: self.numAdminURL, options: .noFileProtection)
        }
        
        if adminList.isEmpty {
            let txtStringList = txtString.split(separator: "\n")
    //        self.archiveURLs.append(URL(fileURLWithPath: "www.apple.com"))
            for i in 0...numOfAdmins-1 {
                
                let newAdmin = Admin(imgStr: String(txtStringList[(i*7)+0]), adminType: String(txtStringList[(i*7)+1]), lastName: String(txtStringList[(i*7)+2]), firstName: String(txtStringList[(i*7)+3]), username: String(txtStringList[(i*7)+4]), callExt: Int(txtStringList[(i*7)+5])!, adminTypeDetailed: String(txtStringList[(i*7)+6]))
                print(self.archiveURLs)
                print("adminType:", String(txtStringList[(i*7)+1]))
                
                let jsonEncoder = JSONEncoder()
                if let jsonData = try? jsonEncoder.encode(newAdmin),
                   let jsonString = String(data: jsonData, encoding: .utf8) {
                    print(jsonString)

                    try? jsonData.write(to: self.archiveURLs[i], options: .noFileProtection)
                }
            
                
                adminList.append(newAdmin)
    //            for admin in adminList {
    //
    //            }
                print(self.archiveURLs)
                
                
            }
            for admin in adminList {
                if admin.adminType == "p" {
        //            print("Principal \(admin.fullName)")
                    principalList.append(admin)
                } else if admin.adminType == "c" {
        //            print("Counselor \(admin.fullName)")
                    counselorList.append(admin)
                } else {
                    print(admin.fullName)
                }
            }
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
        
        
        
//        createAdmins()
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
//        let image = cell.viewWithTag(1234) as! UIImageView
        let subtitle = cell.viewWithTag(2468) as! UILabel
        
        for i in 0...(principalList.count - 1) {
            if indexPath.row == i {
                label.text = principalList[i].fullName
//                image.image = UIImage(named: principalList[i].imgStr!)
                subtitle.text = principalList[i].adminTypeDetailed
                cell.accessoryType = .disclosureIndicator
            }
        }
        // End of new code block
        return cell
    }
    
    override func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        

        tableView.deselectRow(at: indexPath, animated: true)
        
        for i in 0...(principalList.count - 1) {
            if indexPath[1] == i {
                selectedAdmin = principalList[i]
                print(selectedAdmin.fullName)
                let targetViewController = storyboard!.instantiateViewController(withIdentifier: "adminInfoInSchool") as! AdminInfoViewController
                self.navigationController?.showDetailViewController(targetViewController, sender: self)
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
        tableView.deselectRow(at: indexPath, animated: true)
        
        for i in 0...(counselorList.count - 1) {
            print(indexPath[1])
            if indexPath[1] == i {
                selectedAdmin = counselorList[i]
                print(selectedAdmin.fullName)
                let targetViewController = storyboard!.instantiateViewController(withIdentifier: "adminInfoInSchool") as! AdminInfoViewController
                self.navigationController?.showDetailViewController(targetViewController, sender: self)
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
        if let url = NSURL(string: "https://teams.microsoft.com/l/call/0/0?users=\(selectedAdmin.email)"){
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
//start
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
//end

var numberStart = "214496"

var adminList: [Admin] = []
var principalList: [Admin] = []
var counselorList: [Admin] = []
var emergencyContactsList: [String] = ["Coppell Police Department                 972-304-3600", "Dallas Police Department                    214-744-4444", "Irving Police Department                     972-723-1010", "Lewisville Police Department              972-219-3600", "Child Protective Services                     800-252-5400", "Dallas County Mobile Crisis                 866-260-8000"]
//var emergencyContactsList: [String] = []
//"Principal: Laura Springer                      6110", "Associate Principal: Melissa Arnold    6122", "Lead Counselor: Ann Cinelli                 6112",

var selectedAdmin: Admin = Admin(imgStr: "", adminType: "c", lastName: "", firstName: "", username: "", callExt: 0, adminTypeDetailed: "")

enum AdminType {
    case Principal
    case Counselor
}

class Admin: Codable {
    
    var adminType: String
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
    
    enum ChildKeys: CodingKey {
            case adminType,adminTypeDetailed,lastName,firstName,username,callExt,imgStr,fullName,number,email,callLink
        }
    
    init(imgStr: String?, adminType: String, lastName: String, firstName: String, username: String, callExt: Int, adminTypeDetailed: String) {
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
    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(adminType, forKey: .adminType)
//    }
    
    
//    required init(from decoder:Decoder) throws {
//            let values = try decoder.container(keyedBy: CodingKeys.self)
//            indexPath = try values.decode([Int].self, forKey: .indexPath)
//            locationInText = try values.decode(Int.self, forKey: .locationInText)
//        }
    
}

func createAdmins() {
//
//    adminList.removeAll()
//    principalList.removeAll()
//    counselorList.removeAll()
//
    // PRINCIPALS

//    var admin = Admin(imgStr: "Springer_crop", adminType: AdminType.Principal, lastName: "Springer", firstName: "Laura", username: "lspringer", callExt: 6104, adminTypeDetailed: "Principal")
//    adminList.append(admin)
//
//    admin = Admin(imgStr: "Arnold_crop", adminType: AdminType.Principal, lastName: "Arnold", firstName: "Melissa", username: "marnold", callExt: 6122, adminTypeDetailed: "Associate Principal")
//    adminList.append(admin)
//
//    admin = Admin(imgStr: "Rix_crop", adminType: AdminType.Principal, lastName: "Rix", firstName: "Aylor", username: "arix", callExt: 6124, adminTypeDetailed: "Assistant Principal (A-C)")
//    adminList.append(admin)
//
//    admin = Admin(imgStr: "Osborne_crop", adminType: AdminType.Principal, lastName: "Osborne", firstName: "Cindi", username: "cosborne", callExt: 6126, adminTypeDetailed: "Assistant Principal (D-J)")
//    adminList.append(admin)
//
//    admin = Admin(imgStr: "Gollner_crop", adminType: AdminType.Principal, lastName: "Gollner", firstName: "Chris", username: "cgollner", callExt: 6123, adminTypeDetailed: "Assistant Principal (K-M)")
//    adminList.append(admin)
//
//    admin = Admin(imgStr: "Porter_crop", adminType: AdminType.Principal, lastName: "Porter", firstName: "Zane", username: "zporter", callExt: 0, adminTypeDetailed: "Assistant Principal (N-Sf)")
//    adminList.append(admin)
//
//    admin = Admin(imgStr: "Girard_crop", adminType: AdminType.Principal, lastName: "Girard", firstName: "Brandon", username: "bgirard", callExt: 0, adminTypeDetailed: "Assistant Principal (Sg-Z)")
//    adminList.append(admin)
    
//
////    admin = Admin(imgStr: nil, adminType: AdminType.Principal, lastName: "Yakubovsky", firstName: "Michael", username: "myakubovsky", callExt: 6237, adminTypeDetailed: "STEM Teacher")
////    adminList.append(admin)
//
//    // COUNSELORS
//
//    admin = Admin(imgStr: "Cinelli_crop", adminType: AdminType.Counselor, lastName: "Cinelli", firstName: "Ann", username: "acinelli", callExt: 6112, adminTypeDetailed: "Lead Counselor (Rod-Som)")
//    adminList.append(admin)
//
//    admin = Admin(imgStr: "Abreu_crop", adminType: AdminType.Counselor, lastName: "Abreu", firstName: "Cheryl", username: "cabreu", callExt: 6132, adminTypeDetailed: "Counselor (A-Cham)")
//    adminList.append(admin)
//
//    admin = Admin(imgStr: "McMillin_crop", adminType: AdminType.Counselor, lastName: "McMillin", firstName: "Laura", username: "lmcmillin", callExt: 6106, adminTypeDetailed: "Counselor (Chan-Gox)")
//    adminList.append(admin)
//
//    admin = Admin(imgStr: "Kennington_crop", adminType: AdminType.Counselor, lastName: "Kennington", firstName: "Michael", username: "mkennington", callExt: 6133, adminTypeDetailed: "Counselor (Goy-Kiv)")
//    adminList.append(admin)
//
//    admin = Admin(imgStr: "Crumpton_crop", adminType: AdminType.Counselor, lastName: "Crumpton", firstName: "Heather", username: "hcrumpton", callExt: 6135, adminTypeDetailed: "Counselor (Kiw-Nah)")
//    adminList.append(admin)
//
//    admin = Admin(imgStr: "Oh_crop", adminType: AdminType.Counselor, lastName: "Oh", firstName: "Lindsey", username: "loh", callExt: 6136, adminTypeDetailed: "Counselor (Nal-Roc)")
//    adminList.append(admin)
//
//    admin = Admin(imgStr: "Tremethick_crop", adminType: AdminType.Counselor, lastName: "Tremethick", firstName: "Keith", username: "ktremethick", callExt: 6131, adminTypeDetailed: "Counselor (Son-Z)")
//    adminList.append(admin)

    

    // Sort
    
//    for admin in adminList {
//        if admin.adminType == AdminType.Principal {
////            print("Principal \(admin.fullName)")
//            principalList.append(admin)
//        } else if admin.adminType == AdminType.Counselor {
////            print("Counselor \(admin.fullName)")
//            counselorList.append(admin)
//        } else {
//            print(admin.fullName)
//        }
//    }

}

func findAdmin(username: String) -> Admin {
    createAdmins()
    for admin in adminList {
        if admin.username == username {
            return admin
        }
    }
    return Admin(imgStr: "NA", adminType: "c", lastName: "NA", firstName: "NA", username: "NA", callExt: 0, adminTypeDetailed: "NA")
}
