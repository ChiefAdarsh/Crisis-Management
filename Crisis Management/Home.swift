//
//  HomeViewController.swift
//  Crisis Management
//
//  Created by Mukund Raman on 11/7/22.
//

import Foundation
import UIKit
import UniformTypeIdentifiers
class HomeViewController: UIViewController, BackTitle, UIDocumentPickerDelegate {
    
    
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask).first!
    
    /* Variables from Interface Builder */
    
    @IBOutlet weak var Call911Btn: UIButton!
    @IBOutlet weak var ReportBtn: UIButton!
    @IBOutlet weak var ProtocolsBtn: UIButton!
    @IBOutlet weak var CallAdminBtn: UIButton!
    @IBOutlet weak var ResourcesBtn: UIButton!
    @IBOutlet var HomeBtns: [UIButton]!
    var backTitle: String!
    
    // Storyboard instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundBtns(radius: 15)
        self.backTitle = "Home"
        if let ctrs = self.navigationController?.viewControllers, ctrs.count > 1 {
            let viewController = ctrs[ctrs.count - 2] as! BackTitle
            let backButton = UIBarButtonItem()
            backButton.title = viewController.backTitle
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }
        
    }
    
    // Round the corners of the buttons
    func roundBtns(radius: Double) {
        for btn in self.HomeBtns {
            btn.layer.cornerRadius = CGFloat(radius)
            btn.layer.masksToBounds = true
        }
    }
    
    // Call 911 if necessary
    @IBAction func call911(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Alert", message: "Are you sure you want to call 911", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "No", style: .default))
        alertController.addAction(UIAlertAction(title: "Call", style: .destructive, handler: { (_) in
            let alertController = UIAlertController(title: "Calling 911", message: "If this was the final app you'd be calling 911 right now.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
            print("911")
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    // Call In School or Out of School Version of 'Call An Admin' Screen
    @IBAction func generateCSVFile(_ sender: Any) {
        let downloadController = UIAlertController(title: "Downloading", message: "Templates for the two csv files have been downloaded to your files app. Please edit them with a file editing app and save the file as a CSV with the information you want to add.", preferredStyle: .alert)
        downloadController.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(downloadController, animated: true, completion: nil)
        let sFileName = "test.csv"
        let adminFileName = "admintemplate.csv"
        let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let documentURL = URL(fileURLWithPath: documentDirectoryPath).appendingPathComponent(sFileName)
        let documentURL2 = URL(fileURLWithPath: documentDirectoryPath).appendingPathComponent(adminFileName)
        let output = OutputStream.toMemory()
        let output2 = OutputStream.toMemory()
        
        let csvWriter = CHCSVWriter(outputStream: output, encoding: String.Encoding.utf8.rawValue, delimiter: ",".utf16.first!)
        
        csvWriter?.writeField("NAME")
        csvWriter?.writeField("CATEGORY")
        csvWriter?.writeField("CONTACT")
        csvWriter?.writeField("ADDRESS")
        csvWriter?.writeField("WEBSITE")
        csvWriter?.writeField("ADDITIONAL_INFO")
        csvWriter?.finishLine()
        
        var arrOfResourceData = [[String]]()
        
        //arrOfResourceData.append(["Hot Springs", "Psych", "123-456-7890", "101 Burger Drive", "www.com", "test resource 1"])
        //arrOfResourceData.append(["Cold Springs", "Eating Disorder", "098-765-4321", "202 Taco Drive", "www.com", "test resource 2"])
        //arrOfResourceData.append(["Lukewarm Springs", "Crisis Line", "321-654-0987", "303 Pizza Drive", "www.com", "test resource 3"])
        //arrOfResourceData.append(["Warm Springs", "Domestic Violence", "213-546-9870", "404 Apple Drive", "www.com", "test resource 4"])
        //arrOfResourceData.append(["Chilly Springs", "Counseling Center", "563-784-1355", "505 Noodle Drive", "www.com", "test resource 5"])
        //arrOfResourceData.append(["Freezing Springs", "Psych", "634-654-6786", "606 ", "606 Pineapple Drive", "test resource 6"])
        
        for(elements) in arrOfResourceData.enumerated()
        {
            csvWriter?.writeField(elements.element[0])
            csvWriter?.writeField(elements.element[1])
            csvWriter?.writeField(elements.element[2])
            csvWriter?.writeField(elements.element[3])
            csvWriter?.writeField(elements.element[4])
            csvWriter?.writeField(elements.element[5])
            csvWriter?.finishLine()
        }
        
        csvWriter?.closeStream()
        
        let csvWriter2 = CHCSVWriter(outputStream: output2, encoding: String.Encoding.utf8.rawValue, delimiter: ",".utf16.first!)
        
        csvWriter2?.writeField("IMAGE")
        csvWriter2?.writeField("ADMIN TYPE(p/c)")
        csvWriter2?.writeField("LAST NAME")
        csvWriter2?.writeField("FIRST NAME")
        csvWriter2?.writeField("USERNAME")
        csvWriter2?.writeField("EXTENSION")
        csvWriter2?.writeField("DESCRIPTION")
        csvWriter2?.finishLine()
        
        var arrOfResourceData2 = [[String]]()
        
        for(elements) in arrOfResourceData2.enumerated()
        {
            csvWriter2?.writeField(elements.element[0])
            csvWriter2?.writeField(elements.element[1])
            csvWriter2?.writeField(elements.element[2])
            csvWriter2?.writeField(elements.element[3])
            csvWriter2?.writeField(elements.element[4])
            csvWriter2?.writeField(elements.element[5])
            csvWriter2?.writeField(elements.element[6])
            csvWriter2?.finishLine()
        }
        
        csvWriter2?.closeStream()
        
        let buffer = (output.property(forKey: .dataWrittenToMemoryStreamKey) as? Data)!
        let buffer2 = (output2.property(forKey: .dataWrittenToMemoryStreamKey) as? Data)!
        
        do{
            try buffer.write(to: documentURL)
            try buffer2.write(to: documentURL2)
        }
        catch{
            
        }
    }
    
    
    
    @IBAction func importCSV(_ sender: Any) {
        let supportedFiles : [UTType] = [UTType.data]
        
        let controller = UIDocumentPickerViewController(forOpeningContentTypes: supportedFiles,asCopy: true)
        
        controller.delegate = self
        controller.allowsMultipleSelection = false
        present(controller, animated: true, completion: nil)
        
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        
        print(url)
        var urlString = url.absoluteString
        print("a file was selected")
        
        if urlString.contains("test.csv") {
            print("resources file selected")
            let rows = NSArray(contentsOfCSVURL: url, options: CHCSVParserOptions.sanitizesFields) as! [[String]]
            var countingHere = 0
            var che = false
            for row in rows{
                //print(row)
                if countingHere == 0{
                    
                }
                else{
                    var tempResource = Resource(category: row[1], name: row[0], contact: row[2], address: row[3], city: "", state: "", zip: "", website: row[4], addInfo: row[5])
                    for re in yourArray{
                        if re.name == row[0]{
                            che = true
                        }
                        
                    }
                    if che == false{
                        yourArray.append(tempResource)
                    }
                    che = false
                    
                }
                countingHere+=1
            }
        } else if urlString.contains("admintemplate.csv") {
            print("admin file selected")
            let rows = NSArray(contentsOfCSVURL: url, options: CHCSVParserOptions.sanitizesFields) as! [[String]]
            print(rows)
            print(rows.count)
            
            for i in 0...rows.count-1 {
                print(rows[i][0])
                print(rows[i][0].contains("IMAGE"))
                if (rows[i][0].contains("IMAGE") == false) {
                    var newAdmin = Admin(imgStr: rows[i][0], adminType: rows[i][1].lowercased(), lastName: rows[i][2], firstName: rows[i][3], username: rows[i][4], callExt: Int(rows[i][5])!, adminTypeDetailed: rows[i][6])
                    adminList.append(newAdmin)
                }
                for admin in adminList {
                    if admin.adminType == "p" {
                        print("Principal \(admin.fullName)")
                        principalList.append(admin)
                    } else if admin.adminType == "c" {
                        print("Counselor \(admin.fullName)")
                        counselorList.append(admin)
                    } else {
                        print(admin.fullName)
                    }
                }
            }
            
//
        }
        
    }
    
    
    
    
    
    
    @IBAction func callAdminPressed(_ sender: UIButton) {
        //        var callAdminController: UIViewController!
        //        if InOutSchoolController.insideSchool {
        //            callAdminController = storyboard!.instantiateViewController(withIdentifier: "adminInSchool") as! CallAdminInSchoolController
        //        } else {
        //
        //        }
        //        self.navigationController?.pushViewController(callAdminController, animated: true)
        //    }
    }
}






//                print("creating admin")
//                var newAdmin = Admin(imgStr: rows[0][0], adminType: <#T##String#>, lastName: <#T##String#>, firstName: <#T##String#>, username: <#T##String#>, callExt: <#T##Int#>, adminTypeDetailed: <#T##String#>)
//            }
//            var countingHere = 0
//            for row in rows{
//                //print(row)
//                if countingHere == 0{
//                    print("yoohoo")
//                }
//                else{
//                    let jsonEncoder = JSONEncoder()
//                    if let jsonData = try? jsonEncoder.encode(numAdmin(numOfAdmins: rows.count-1)),
//                       let jsonString = String(data: jsonData, encoding: .utf8) {
//                        print(jsonString)
//
//                        try? jsonData.write(to: self.numAdminURL, options: .noFileProtection)
//                    }
//
//                    if adminList.isEmpty {
//                        print("creating admin")
//                        var newAdmin = Admin(imgStr: row[0], adminType: row[1], lastName: row[2], firstName: row[3], username: row[4], callExt: Int(row[5])!, adminTypeDetailed: row[6])
//                        print(newAdmin.fullName)
//                    }
//
//
//
//
//                }
//                countingHere+=1
//            }
           
