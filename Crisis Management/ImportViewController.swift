//
//  ImportViewController.swift
//  Crisis Management
//
//  Not created by Varshith Peddi on 3/29/23.
//

import Foundation
import UIKit
import UniformTypeIdentifiers

class ImportViewController: UIViewController, UIDocumentPickerDelegate {
    
    @IBAction func importDataBut(_ sender: Any) {
        var alertController:UIAlertController?
            alertController = UIAlertController(title: "Database URL",
                message: "Enter a valid database URL", preferredStyle: .alert)

        alertController!.addTextField(configurationHandler: {(textField: UITextField!) in textField.placeholder = "Enter Database URL"
            })

        let saveAction = UIAlertAction(title: "Import", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let textField = (alertController?.textFields![0])! as UITextField
            let url = textField.text!
            
            if let dataUrl = URL(string: "https://student-central-resources-default-rtdb.firebaseio.com/users.json") {
               URLSession.shared.dataTask(with: dataUrl) { data, response, error in
                  if let data = data {
                     if let jsonString = String(data: data, encoding: .utf8) {
                        print("json:", jsonString)
                     }
                   }
               }.resume()
            }
            
//            print(url)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {(action : UIAlertAction!) -> Void in })
        
        alertController!.addAction(cancelAction)
        alertController!.addAction(saveAction)
        self.present(alertController!, animated: true, completion: nil)
        
//        let alertController = UIAlertController(title: "Database URL", message: "Please enter a valid Database URL", preferredStyle: .alert)
//        alertController.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
//        self.present(alertController, animated: true, completion: nil)
//        present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
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
        
//        print(url)
//        var urlString = url.absoluteString
//        print("AAA file was selected")
//
//        if urlString.contains("test.csv") {
//            print("resources file selected")
//            let rows = NSArray(contentsOfCSVURL: url, options: CHCSVParserOptions.sanitizesFields) as! [[String]]
//            var countingHere = 0
//            var che = false
//            for row in rows{
//                //print(row)
//                if countingHere == 0{
//
//                }
//                else{
//                    var tempResource = Resource(category: row[1], name: row[0], contact: row[2], address: row[3], city: "", state: "", zip: "", website: row[4], addInfo: row[5])
//                    for re in yourArray{
//                        if re.name == row[0]{
//                            che = true
//                        }
//
//                    }
//                    if che == false{
//                        yourArray.append(tempResource)
//                    }
//                    che = false
//
//                }
//                countingHere+=1
//            }
//        } else if urlString.contains("admintemplate.csv") {
//            print("admin file selected")
//            let rows = NSArray(contentsOfCSVURL: url, options: CHCSVParserOptions.sanitizesFields) as! [[String]]
//            print(rows)
//            print(rows.count)
//
//            for i in 0...rows.count-1 {
//                print(rows[i][0])
//                print(rows[i][0].contains("IMAGE"))
//                if (rows[i][0].contains("IMAGE") == false) {
//                    var newAdmin = Admin(imgStr: rows[i][0], adminType: rows[i][1].lowercased(), lastName: rows[i][2], firstName: rows[i][3], username: rows[i][4], callExt: Int(rows[i][5])!, adminTypeDetailed: rows[i][6])
//                    adminList.append(newAdmin)
//                }
//                for admin in adminList {
//                    if admin.adminType == "p" {
//                        print("Principal \(admin.fullName)")
//                        principalList.append(admin)
//                    } else if admin.adminType == "c" {
//                        print("Counselor \(admin.fullName)")
//                        counselorList.append(admin)
//                    } else {
//                        print(admin.fullName)
//                    }
//                }
//            }
//        }
        
        print("url:", url)
        var urlString = url.absoluteString
        print("adfjkhgkjfd file was selected")
        
        if urlString.contains("test.csv") {
            print("resources file selected")
            let rows = NSArray(contentsOfCSVURL: url, options: CHCSVParserOptions.sanitizesFields) as! [[String]]
            print("AAAADARSH")
            var countingHere = 0
            var che = false
            for row in rows {
                print("row:",row)
                var make = Resource(category: row[1], name: row[0], contact: row[2], address: row[3], city: "", state: "", zip: "", website: row[4], addInfo: row[5])
                for re in yourArray{
                    if re.name == row[0]{
                        che = true
                    }
                    
                }
                if countingHere == 0 {
                    countingHere += 1
                    continue
                }
                print("che:", che)
                if che == false {
                    print("TRUEE")
                    print(make.category + make.name + make.contact + make.address + make.website + make.addInfo)
                    yourArray.append(make)
                    AppDelegate.extraResources.append(make)
                    //HelpViewController.empty.append(selectedCategory)
                    print(HelpViewController.empty)
                    AppDelegate.numOfResources += 1
                    let numResource = numResource(numOfResources: AppDelegate.numOfResources)
                    
                    AppDelegate.archiveURLs.append(AppDelegate.documentsDirectory.appendingPathComponent("resource\(AppDelegate.numOfResources)").appendingPathExtension("plist"))
                    
                    let jsonEncoder = JSONEncoder()
                    if let jsonData = try? jsonEncoder.encode(numResource),
                       let jsonString = String(data: jsonData, encoding: .utf8) {
                        print(jsonString)

                        try? jsonData.write(to: AppDelegate.numResourceURL, options: .noFileProtection)
                    }
                    
                    for i in 0...AppDelegate.extraResources.count-1 {
                        let resource = AppDelegate.extraResources[i]
                        let jsonEncoder = JSONEncoder()
                        if let jsonData = try? jsonEncoder.encode(resource),
                           let jsonString = String(data: jsonData, encoding: .utf8) {
                            print(jsonString)

                            try? jsonData.write(to: AppDelegate.archiveURLs[i], options: .noFileProtection)
                        }
                    }
                }
                che = false
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
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
