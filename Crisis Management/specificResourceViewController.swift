//
//  specificResourceViewController.swift
//  Crisis Management
//
//  Created by Rushil Patel on 11/7/22.
//

import UIKit

class specificResourceViewController: UIViewController {
    @IBOutlet var resNameLabel: UILabel!
    @IBOutlet var resCatLabel: UILabel!
    @IBOutlet var resDescLabel: UILabel!
    @IBOutlet var resWebLabel: UILabel!
    @IBOutlet var resContLabel: UILabel!
    @IBOutlet var resAddressLabel: UILabel!
    var ad = Resource.myArray[myIndex].address
    var ci = Resource.myArray[myIndex].city
    var st = Resource.myArray[myIndex].state
    var zi = Resource.myArray[myIndex].zip
    override func viewDidLoad() {
        super.viewDidLoad()
        resNameLabel.text = Resource.myArray[myIndex].name
        resCatLabel.text = Resource.myArray[myIndex].category
        resDescLabel.text = Resource.myArray[myIndex].addInfo
        resWebLabel.text = Resource.myArray[myIndex].website
        resContLabel.text = Resource.myArray[myIndex].contact
        if(Resource.myArray[myIndex].category == "Crisis Lines"){
            resAddressLabel.text = "";
        }
        else{
            resAddressLabel.text = ad + " " + ci + ", " + st + " " + zi
        }
    }
    
}
