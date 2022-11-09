//
//  CounselorViewController.swift
//  Crisis Management
//
//  Created by Ashwin Indurti on 11/8/22.
//

import UIKit

class CinelliViewController: UIViewController {
    
    @IBOutlet var AdminPic: UIImageView!
    @IBOutlet var AdminLbl: UILabel!
    @IBOutlet var CallBtn: UIButton!
    @IBOutlet var EmailBtn: UIButton!
    @IBOutlet var NavTtl: UINavigationItem!
    var admin = findAdmin(username: "acinelli")
    
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

class AbreuViewController: UIViewController {
    
    @IBOutlet var AdminPic: UIImageView!
    @IBOutlet var AdminLbl: UILabel!
    @IBOutlet var CallBtn: UIButton!
    @IBOutlet var EmailBtn: UIButton!
    @IBOutlet var NavTtl: UINavigationItem!
    var admin = findAdmin(username: "cabreu")
    
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

class McMillinViewController: UIViewController {
    
    @IBOutlet var AdminPic: UIImageView!
    @IBOutlet var AdminLbl: UILabel!
    @IBOutlet var CallBtn: UIButton!
    @IBOutlet var EmailBtn: UIButton!
    @IBOutlet var NavTtl: UINavigationItem!
    var admin = findAdmin(username: "lmcmillin")
    
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

class KenningtonViewController: UIViewController {
    
    @IBOutlet var AdminPic: UIImageView!
    @IBOutlet var AdminLbl: UILabel!
    @IBOutlet var CallBtn: UIButton!
    @IBOutlet var EmailBtn: UIButton!
    @IBOutlet var NavTtl: UINavigationItem!
    var admin = findAdmin(username: "mkennington")
    
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

class CrumptonViewController: UIViewController {
    
    @IBOutlet var AdminPic: UIImageView!
    @IBOutlet var AdminLbl: UILabel!
    @IBOutlet var CallBtn: UIButton!
    @IBOutlet var EmailBtn: UIButton!
    @IBOutlet var NavTtl: UINavigationItem!
    var admin = findAdmin(username: "hcrumpton")
    
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

class OhViewController: UIViewController {
    
    @IBOutlet var AdminPic: UIImageView!
    @IBOutlet var AdminLbl: UILabel!
    @IBOutlet var CallBtn: UIButton!
    @IBOutlet var EmailBtn: UIButton!
    @IBOutlet var NavTtl: UINavigationItem!
    var admin = findAdmin(username: "loh")
    
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

class TremethickViewController: UIViewController {
    
    @IBOutlet var AdminPic: UIImageView!
    @IBOutlet var AdminLbl: UILabel!
    @IBOutlet var CallBtn: UIButton!
    @IBOutlet var EmailBtn: UIButton!
    @IBOutlet var NavTtl: UINavigationItem!
    var admin = findAdmin(username: "ktremethick")
    
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
