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
        
        let sFileName = "test.csv"
        let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let documentURL = URL(fileURLWithPath: documentDirectoryPath).appendingPathComponent(sFileName)
        let output = OutputStream.toMemory()
        
        let csvWriter = CHCSVWriter(outputStream: output, encoding: String.Encoding.utf8.rawValue, delimiter: ",".utf16.first!)
        
        csvWriter?.writeField("NAME")
        csvWriter?.writeField("CATEGORY")
        csvWriter?.writeField("CONTACT")
        csvWriter?.writeField("ADDRESS")
        csvWriter?.writeField("WEBSITE")
        csvWriter?.writeField("ADDITIONAL_INFO")
        csvWriter?.finishLine()
        
        var arrOfResourceData = [[String]]()
        
        arrOfResourceData.append(["test", "test", "test", "test", "test", "test"])
        arrOfResourceData.append(["test1", "test1", "test1", "test1", "test1", "test1"])
        
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
        
        let buffer = (output.property(forKey: .dataWrittenToMemoryStreamKey) as? Data)!
        
        do{
            try buffer.write(to: documentURL)
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
        
        print("a file was selected")
        let rows = NSArray(contentsOfCSVURL: url, options: CHCSVParserOptions.sanitizesFields) as! [[String]]
        var countingHere = 0
        for row in rows{
            //print(row)
            if countingHere == 0{
                
            }
            else{
                var tempResource = Resource(category: row[0], name: row[1], contact: row[2], address: row[3], city: "", state: "", zip: "", website: row[4], addInfo: row[5])
                yourArray.append(tempResource)
            }
            countingHere+=1
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
