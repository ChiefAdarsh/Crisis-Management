//
//  SpringerViewController.swift
//  Crisis Management
//
//  Created by Ashwin Indurti on 11/7/22.
//

import UIKit

class SpringerViewController: UIViewController {
    
    @IBOutlet var NavTtl: UINavigationItem!
    @IBOutlet var AdminPic: UIImageView!
    @IBOutlet var CallBtn: UIButton!
    @IBOutlet var EmailBtn: UIButton!
    @IBOutlet var AdminLbl: UILabel!
    var admin = findAdmin(username: "lspringer")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavTtl.title = "\(admin.fullName)"
        AdminPic.image = UIImage(named: admin.imgStr)
        AdminLbl.text = "\(admin.fullName), \(admin.adminTypeDetailed)"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func call(_ sender: Any) {
        if let url = NSURL(string: admin.callLink){
            UIApplication.shared.open(url as URL)
        }
    }
    
    @IBAction func email(_ sender: Any) {
        let email = admin.email
        if let url = URL(string: "mailto:\(email)") {
          if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
          } else {
            UIApplication.shared.openURL(url)
          }
        }
    }
}

class ArnoldViewController: UIViewController {
    
    @IBOutlet var NavTtl: UINavigationItem!
    @IBOutlet var AdminPic: UIImageView!
    @IBOutlet var CallBtn: UIButton!
    @IBOutlet var EmailBtn: UIButton!
    @IBOutlet var AdminLbl: UILabel!
    
    var admin = findAdmin(username: "marnold")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavTtl.title = "\(admin.fullName)"
        AdminPic.image = UIImage(named: admin.imgStr)
        AdminLbl.text = "\(admin.fullName), \(admin.adminTypeDetailed)"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func call(_ sender: Any) {
        if let url = NSURL(string: admin.callLink){
            UIApplication.shared.open(url as URL)
        }
    }
    
    @IBAction func email(_ sender: Any) {
        let email = admin.email
        if let url = URL(string: "mailto:\(email)") {
          if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
          } else {
            UIApplication.shared.openURL(url)
          }
        }
    }
}

class RixViewController: UIViewController {
    
    @IBOutlet var NavTtl: UINavigationItem!
    @IBOutlet var AdminPic: UIImageView!
    @IBOutlet var CallBtn: UIButton!
    @IBOutlet var EmailBtn: UIButton!
    @IBOutlet var AdminLbl: UILabel!
    var admin = findAdmin(username: "arix")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavTtl.title = "\(admin.fullName)"
        AdminPic.image = UIImage(named: admin.imgStr)
        AdminLbl.text = "\(admin.fullName), \(admin.adminTypeDetailed)"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func call(_ sender: Any) {
        if let url = NSURL(string: admin.callLink){
            UIApplication.shared.open(url as URL)
        }
    }
    
    @IBAction func email(_ sender: Any) {
        let email = admin.email
        if let url = URL(string: "mailto:\(email)") {
          if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
          } else {
            UIApplication.shared.openURL(url)
          }
        }
    }
}

class GollnerViewController: UIViewController {
    
    
    @IBOutlet var NavTtl: UINavigationItem!
    @IBOutlet var AdminPic: UIImageView!
    @IBOutlet var AdminLbl: UILabel!
    @IBOutlet var CallBtn: UIButton!
    @IBOutlet var EmailBtn: UIButton!
    var admin = findAdmin(username: "cgollner")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavTtl.title = "\(admin.fullName)"
        AdminPic.image = UIImage(named: admin.imgStr)
        print(admin.imgStr)
        AdminLbl.text = "\(admin.fullName), \(admin.adminTypeDetailed)"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func call(_ sender: Any) {
        if let url = NSURL(string: admin.callLink){
            UIApplication.shared.open(url as URL)
        }
    }
    
    @IBAction func email(_ sender: Any) {
        let email = admin.email
        if let url = URL(string: "mailto:\(email)") {
          if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
          } else {
            UIApplication.shared.openURL(url)
          }
        }
    }
    
    
}

class PorterViewController: UIViewController {
    
    @IBOutlet var AdminPic: UIImageView!
    @IBOutlet var AdminLbl: UILabel!
    @IBOutlet var CallBtn: UIButton!
    @IBOutlet var EmailBtn: UIButton!
    @IBOutlet var NavTtl: UINavigationItem!
    var admin = findAdmin(username: "zporter")

    override func viewDidLoad() {
        super.viewDidLoad()
        NavTtl.title = "\(admin.fullName)"
        AdminPic.image = UIImage(named: admin.imgStr)
        print(admin.imgStr)
        AdminLbl.text = "\(admin.fullName), \(admin.adminTypeDetailed)"
    }
    
    @IBAction func call(_ sender: Any) {
        if let url = NSURL(string: admin.callLink){
            UIApplication.shared.open(url as URL)
        }
    }
    
    @IBAction func email(_ sender: Any) {
        let email = admin.email
        if let url = URL(string: "mailto:\(email)") {
          if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
          } else {
            UIApplication.shared.openURL(url)
          }
        }
    }
}
