//
//  ResourcesPullDownViewController.swift
//  Crisis Management
//
//  Created by Yadushan Thillainathan on 3/2/23.
//

import UIKit

class CellClass: UITableViewCell {
    
}

struct numResource : Codable {
    var numOfResources: Int
}

class ResourcesPullDownViewController: UIViewController {
    @IBOutlet weak var resourcesDropDownButton: UIButton!
    @IBOutlet weak var enterName: UITextField!
    @IBOutlet weak var enterCat: UITextField!
    @IBOutlet weak var enterContact: UITextField!
    @IBOutlet weak var enterAddress: UITextField!
    @IBOutlet weak var enterWebsite: UITextField!
    @IBOutlet weak var enterAddInfo: UITextField!
    @IBOutlet weak var erro: UILabel!
    @IBOutlet weak var creat3: UIButton!

    let transparentView = UIView()
    let tableView = UITableView()
    var selectedCategory = ""
    var selectedButton = UIButton()
    var sele = "";
    var dataSource = [String]()
    var boool: Bool = false
    
    
    //PARAMETERS
    static var newCat: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        erro.isHidden = true
        if ResourcesPullDownViewController.newCat{
            resourcesDropDownButton.isHidden = true
            enterCat.isHidden = false
        }
        else{
            enterCat.isHidden = true
            resourcesDropDownButton.isHidden = false
        }
        enterName.delegate = self
        enterCat.delegate = self
        enterContact.delegate = self
        enterAddress.delegate = self
        enterWebsite.delegate = self
        enterAddInfo.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CellClass.self, forCellReuseIdentifier: "Cell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
//    @objc func keyboardWillShow(notification: NSNotification) {
//        print("Hello")
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            if view.frame.origin.y == 0 {
//                self.view.frame.origin.y -= keyboardSize.height-6*enterWebsite.frame.height
//                self.view.frame.origin.y -= keyboardSize.height-6*enterAddInfo.frame.height
//            }
//        }
//    }
    @IBAction func websiteEdited(_ sender: Any) {
        print("Hello")
        boool = true
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue, boool {
            if view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height-6*enterWebsite.frame.height
            }
            boool = false
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @IBAction func addInfoEdited(_ sender: Any) {
        print("Hello")
        func keyboardWillShow(notification: NSNotification) {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                if view.frame.origin.y == 0 {
                    self.view.frame.origin.y -= keyboardSize.height-6*enterAddInfo.frame.height
                }
            }
        }
        func keyboardWillHide(notification: NSNotification) {
            if view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        }
    }
    
    
//    @objc func keyboardWillHide(notification: NSNotification) {
//        if view.frame.origin.y != 0 {
//            self.view.frame.origin.y = 0
//        }
//    }
    

    
    @IBAction func createRes(_ sender: Any) {
        if !enterCat.hasText && selectedCategory.isEmpty && !enterName.hasText {
            erro.text = "Please Enter Name and Category"
        }
        else if !enterCat.hasText && selectedCategory.isEmpty {
            erro.text = "Please Enter Category"
            erro.isHidden = false
        }
        else if !enterName.hasText {
            erro.text = "Please Enter Name"
            erro.isHidden = false;
        }
        else if ResourcesPullDownViewController.newCat{
            var make = Resource(category: enterCat.text ?? "", name: enterName.text ?? "", contact: enterContact.text ?? "", address: enterAddress.text ?? "", city: "", state: "", zip: "", website: enterWebsite.text ?? "", addInfo: enterAddInfo.text ?? "")
            print(make.category + make.name + make.contact + make.address + make.website + make.addInfo)
            yourArray.append(make)
            AppDelegate.extraResources.append(make)
            HelpViewController.empty.append(enterCat.text ?? "")
            print(HelpViewController.empty)
            AppDelegate.numOfResources += 1
            let numResource = numResource(numOfResources: AppDelegate.numOfResources)
            
            let jsonEncoder = JSONEncoder()
            if let jsonData = try? jsonEncoder.encode(numResource),
               let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)

                try? jsonData.write(to: AppDelegate.numResourceURL, options: .noFileProtection)
            }
            
            if AppDelegate.archiveURLs.isEmpty {
                AppDelegate.archiveURLs.append(AppDelegate.documentsDirectory.appendingPathComponent("resource1")
                    .appendingPathExtension("plist"))
            }
            
            print("count:", AppDelegate.extraResources.count)
            for i in 0...AppDelegate.extraResources.count-1 {
                print("i:", i)
                let resource = AppDelegate.extraResources[i]
                let jsonEncoder = JSONEncoder()
                if let jsonData = try? jsonEncoder.encode(resource),
                   let jsonString = String(data: jsonData, encoding: .utf8) {
                    print(jsonString)
                    print("archiveurls:", AppDelegate.archiveURLs)
                    try? jsonData.write(to: AppDelegate.archiveURLs[i], options: .noFileProtection)
                }
            }
            
//            for i in 0...numOfResources {
//
//                let newResource = Admin(imgStr: String(txtStringList[(i*7)+0]), adminType: String(txtStringList[(i*7)+1]), lastName: String(txtStringList[(i*7)+2]), firstName: String(txtStringList[(i*7)+3]), username: String(txtStringList[(i*7)+4]), callExt: Int(txtStringList[(i*7)+5])!, adminTypeDetailed: String(txtStringList[(i*7)+6]))
//                print(self.archiveURLs)
//                print("adminType:", String(txtStringList[(i*7)+1]))
//
//                let jsonEncoder = JSONEncoder()
//                if let jsonData = try? jsonEncoder.encode(newAdmin),
//                   let jsonString = String(data: jsonData, encoding: .utf8) {
//                    print(jsonString)
//
//                    try? jsonData.write(to: self.archiveURLs[i], options: .noFileProtection)
//                }
//
//
//                adminList.append(newAdmin)
//    //            for admin in adminList {
//    //
//    //            }
//                print(self.archiveURLs)
//
//
//            }
            
            self.dismiss(animated: true)
        }
        else{
            var make = Resource(category: selectedCategory, name: enterName.text ?? "", contact: enterContact.text ?? "", address: enterAddress.text ?? "", city: "", state: "", zip: "", website: enterWebsite.text ?? "", addInfo: enterAddInfo.text ?? "")
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
            
            self.dismiss(animated: true)
        }
            
        
        
        //tableView.reloadData()
        HelpViewController.tb.reloadData()
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

//        if let firstVC = presentingViewController as? HelpViewController {
//            DispatchQueue.main.async {
//                firstVC.sheesh.reloadData()
//            }
//        }
        HelpViewController.tb.reloadData()
    }
    
    func addTransparentView(frames: CGRect) {
        let window = UIApplication.shared.keyWindow
        transparentView.frame = window?.frame ?? self.view.frame
        self.view.addSubview(transparentView)
        
        tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
        self.view.addSubview(tableView)
        tableView.layer.cornerRadius = 5
        
        //transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
        transparentView.addGestureRecognizer(tapgesture)
        transparentView.alpha = 0
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {self.transparentView.alpha = 0.5; self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height + 5, width: frames.width, height: 200)}, completion: nil)
    }
    
    @objc func removeTransparentView() {
        let frames = selectedButton.frame
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {self.transparentView.alpha = 0; self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)}, completion: nil)
    }
    
    @IBAction func categoryTap(_ sender: Any) {
        for yeahh in yourArray{
            if(!dataSource.contains(yeahh.category)){
                    dataSource.append(yeahh.category)
            }
            
        }
        selectedButton = resourcesDropDownButton
        addTransparentView(frames: resourcesDropDownButton.frame)
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

extension ResourcesPullDownViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


extension ResourcesPullDownViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedButton.setTitle(dataSource[indexPath.row], for: .normal)
        selectedButton.titleLabel?.textAlignment = .center
        removeTransparentView()
        selectedCategory = dataSource[indexPath.row]
        print(selectedCategory)
        sele = selectedCategory
    }
}
