//
//  ViewController.swift
//  funn
//
//  Created by Rushil Patel on 2/6/23.
//

import UIKit
import SwiftUI
class Resource: Codable {
    var category: String
    var name: String
    var contact: String
    var address: String
    var city: String
    var state: String
    var zip: String
    var website: String
    var addInfo: String
    
    
    init(category: String, name: String, contact: String, address: String, city: String, state: String, zip: String, website: String, addInfo: String) {
        self.category = category
        self.name = name
        self.contact = contact
        self.address = address
        self.city = city
        self.state = state
        self.zip = zip
        self.website = website
        self.addInfo = addInfo
    }
    
}

class ViewControllerResPage: UIViewController {
    
    @IBOutlet weak var resName: UILabel!
    @IBOutlet weak var resCat: UILabel!
    @IBOutlet weak var resCont: UILabel!
    @IBOutlet weak var someTableView: UITableView!
    @IBOutlet weak var resAddInfo: UILabel!
    @IBOutlet weak var resAddress: UILabel!
    @IBOutlet weak var resWeb: UILabel!
    
    @IBOutlet weak var ba: UIImageView!
    static var category: String!
    var currDel = false
    var order: String = ""
    var resources = [Resource]()
    @IBOutlet weak var deleteRez: UIButton!
    
    @IBAction func deleteRezzing(_ sender: Any) {
        print("check tap")
        let tableViewEditingMode = someTableView.isEditing
        someTableView.setEditing(!tableViewEditingMode, animated: true)
        if(currDel){
            currDel = false
            deleteRez.setTitle("Delete Resources", for: .normal)
        }
        else{
            currDel = true
            deleteRez.setTitle("Done Deleting", for: .normal)
        }
    }
    
    


    override func viewDidLoad() {
        for res in yourArray {
            if res.category == ViewControllerResPage.category {
                resources.append(res)
                order = res.category
            }
        }
        if ViewControllerResPage.category == "Food"{
            ba.image = UIImage(named: "mealproviderslight")
        }
        else{
            ba.image = UIImage(named: "Background 1")
        }
        someTableView.delegate = self
        someTableView.dataSource = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewControllerResPage.tapFunction))
                resWeb.isUserInteractionEnabled = true
                resWeb.addGestureRecognizer(tap)
        let tapAddy = UITapGestureRecognizer(target: self, action: #selector(ViewControllerResPage.tapFunctionAddy))
                resAddress.isUserInteractionEnabled = true
                resAddress.addGestureRecognizer(tapAddy)
        super.viewDidLoad()
        someTableView.separatorStyle = .none
    }

    @objc
        func tapFunction(sender:UITapGestureRecognizer) {
            UIApplication.shared.open(URL(string: "https://" + (resWeb.text ?? ""))! as URL, options: [:], completionHandler: nil)        }
    
    @objc
        func tapFunctionAddy(sender:UITapGestureRecognizer) {
            var tempAddress = resAddress.text?.replacingOccurrences(of: " ", with: "%20")
            UIApplication.shared.open(URL(string: "https://maps.apple.com/?address=" + (tempAddress ?? ""))! as URL, options: [:], completionHandler: nil)
                    }

}


extension ViewControllerResPage: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = someTableView.dequeueReusableCell(withIdentifier: "someCell") as! TVC
//        print("row: ", indexPath.row)
        
        cell.someLabel.text = resources[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var addy = ""
//        print("row: ", indexPath.row)
        if(resources[indexPath.row].address != "") {
           addy = resources[indexPath.row].address + " " + resources[indexPath.row].city + ", " + resources[indexPath.row].state + " " + resources[indexPath.row].zip
        }
        
        resName.text = resources[indexPath.row].name
        resCat.text = resources[indexPath.row].category
        resCont.text = resources[indexPath.row].contact
        resWeb.text = resources[indexPath.row].website
        resAddress.text = resources[indexPath.row].address
        resAddInfo.text = resources[indexPath.row].addInfo
    }
    
    func tableView(_ tableView: UITableView, moveRowAt
    fromIndexPath: IndexPath, to: IndexPath) {
        let movedEmoji2 = resources.remove(at: fromIndexPath.row)
        resources.insert(movedEmoji2, at: to.row)
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//      if editingStyle == .delete {
//        print("Deleted")
//        print(resources.count)
//        resources.remove(at: indexPath.row)
//        yourArray.remove(at: indexPath.row)
//        print("------------------------")
//        print(resources.count)
//        print("------------------------")
//        self.someTableView.deleteRows(at: [indexPath], with: .automatic)
//      }
//    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        print("Deleted")
        print(resources.count)
        resources.remove(at: indexPath.row)
        yourArray.remove(at: indexPath.row)
          AppDelegate.numOfResources -= 1
          AppDelegate.archiveURLs.removeLast()
        
          
        print("------------------------")
        print(resources.count)
        print("------------------------")
        self.someTableView.deleteRows(at: [indexPath], with: .automatic)
        
          let numResource = numResource(numOfResources: AppDelegate.numOfResources)
          
//          AppDelegate.archiveURLs.append(AppDelegate.documentsDirectory.appendingPathComponent("resource\(AppDelegate.numOfResources)").appendingPathExtension("plist"))
          
          let jsonEncoder = JSONEncoder()
          if let jsonData = try? jsonEncoder.encode(numResource),
             let jsonString = String(data: jsonData, encoding: .utf8) {
              print(jsonString)

              try? jsonData.write(to: AppDelegate.numResourceURL, options: .noFileProtection)
          }
          print(yourArray)
          for i in 0...yourArray.count {
              if i > yourArray.count-1 {
                  continue
              }
              let resource = yourArray[i]
              let jsonEncoder = JSONEncoder()
              if let jsonData = try? jsonEncoder.encode(resource),
                 let jsonString = String(data: jsonData, encoding: .utf8) {
                  print(jsonString)

                  try? jsonData.write(to: AppDelegate.archiveURLs[i], options: .noFileProtection)
              }
          }
        
      }
        
        
        
        
    }
    
    
}
