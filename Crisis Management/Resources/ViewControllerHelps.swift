//
//  ViewControllerMEEE.swift
//  funn
//
//  Created by Rushil Patel on 2/7/23.
//

import UIKit

class HelpViewController: UIViewController {
    

    var wordd : String = ""
    var mt = Set<String>()
    static var empty = [String]()
    @IBOutlet weak var sheesh: UITableView!
    static var tb: UITableView!
    var isDeleting = false
    
    
    @IBOutlet var stackView: UIStackView!
    
    @IBOutlet weak var deleteResources: UIButton!
    
    @IBAction func deleteCatt(_ sender: Any) {
        let tableViewEditingMode = sheesh.isEditing
        sheesh.setEditing(!tableViewEditingMode, animated: true)
        if(isDeleting){
            isDeleting = false
            deleteResources.setTitle("Delete Categories", for: .normal)
        }
        else{
            isDeleting = true
            deleteResources.setTitle("Done Deleting", for: .normal)
        }
    }
    
    
    
    @IBAction func housingTap(_ sender: Any) {
        wordd = "Housing"
    }
    @IBAction func shelterTap(_ sender: Any) {
        wordd = "Shelter"
    }
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        sheesh.delegate = self
        sheesh.dataSource = self
        HelpViewController.tb = sheesh

        
        for yeahh in yourArray{
            if(!HelpViewController.empty.contains("Food")){
                HelpViewController.empty.append("Food")
            }
            if(!HelpViewController.empty.contains(yeahh.category)){
                //if(yeahh.category != "Housing" && yeahh.category != "Shelter" && yeahh.category != "General Health" && yeahh.category != "Mental Health" && yeahh.category != "Aids and HIV" && yeahh.category != "Substance Abuse" && yeahh.category != "Pregnancy"){
                    HelpViewController.empty.append(yeahh.category)
                //}
                
            }
            
            
        }
        
            
        //for okayy in mt{
         //   empty.append(okayy)
       // }
//        let size = UIScreen.main.bounds.size
//        if size.height < size.width {
//            stackView.axis = .horizontal
//        } else {
//            stackView.axis = .vertical
//        }
//        sheesh.separatorStyle = .none
//
        // Do any additional setup after loading the view.
    }
    
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransition(to: size, with: coordinator)
//        guard let _ = stackView else { return }
//
//        if UIDevice.current.orientation.isLandscape {
//            stackView.axis = .horizontal
//        } else {
//            stackView.axis = .vertical
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension HelpViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HelpViewController.empty.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = sheesh.dequeueReusableCell(withIdentifier: "SHOOOSH") as! TableViewCellSHEESH
        
        
        cell2.labelSheesh.text = HelpViewController.empty[indexPath.row]
        
        return cell2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        wordd = empty[indexPath.row]
        
        ViewControllerResPage.category = HelpViewController.empty[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, moveRowAt
    fromIndexPath: IndexPath, to: IndexPath) {
        let movedEmoji = HelpViewController.empty.remove(at: fromIndexPath.row)
        HelpViewController.empty.insert(movedEmoji, at: to.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        print("Deleted")
          var category: String = HelpViewController.empty[indexPath.row]
          
          for i in 0...yourArray.count {
              if i > yourArray.count {
                  continue
              }
              let yeahh = yourArray[i]
              if(yeahh.category == category) {
                  yourArray.remove(at: i)
                  AppDelegate.numOfResources -= 1
                  AppDelegate.archiveURLs.removeLast()
              }
          }
          
//          self.sheesh.cellForRow(at: indexPath.row).
          HelpViewController.empty.remove(at: indexPath.row)
        self.sheesh.deleteRows(at: [indexPath], with: .automatic)
          
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
