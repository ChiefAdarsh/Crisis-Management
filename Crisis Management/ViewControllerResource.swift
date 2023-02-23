//
//  ViewController.swift
//  funn
//
//  Created by Rushil Patel on 2/6/23.
//

import UIKit
class Resource{
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
    
    var order: String = ""
    var resources = [Resource]()
    //try adding to function on top of superview so expected declaratin doesnt arise
    
    
    


    override func viewDidLoad() {
        resources.removeAll()
        super.viewDidLoad()
        someTableView.delegate = self
        someTableView.dataSource = self
        for res in yourArray{
            if res.category == order{
                resources.append(res)
            }
        }
        someTableView.separatorStyle = .none
    }

    
}

extension ViewControllerResPage: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = someTableView.dequeueReusableCell(withIdentifier: "someCell") as! TVC
        
        
        cell.someLabel.text = resources[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var addy = ""
        if(resources[indexPath.row].address != ""){
           addy = resources[indexPath.row].address + " " + resources[indexPath.row].city + ", " + resources[indexPath.row].state + " " + resources[indexPath.row].zip
        }
        
        resName.text = resources[indexPath.row].name
        resCat.text = resources[indexPath.row].category
        resCont.text = resources[indexPath.row].contact
        resWeb.text = resources[indexPath.row].website
        resAddress.text = addy
        resAddInfo.text = resources[indexPath.row].addInfo
    }
    
    
}
