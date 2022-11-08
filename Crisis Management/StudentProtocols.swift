//
//  StudentProtocols.swift
//  Crisis Management
//
//  Created by Adarsh Goura on 11/4/22.
//

import UIKit

class ChecklistViewController: UIViewController {

    @IBOutlet var submitButton: UIButton!
    
    @IBOutlet var check1: UIButton!
    @IBOutlet var check2: UIButton!
    @IBOutlet var check3: UIButton!
    @IBOutlet var check4: UIButton!
    @IBOutlet var check5: UIButton!
    
    @IBSegueAction func segueAction(_ coder: NSCoder) -> ProtocolsViewController? {
        return ProtocolsViewController(coder: coder)
    }
    
    @IBOutlet var subtitle: UILabel!
    
    init?(coder: NSCoder, inOrOut: String) {
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        check1.setTitle("", for: .normal)
        check2.setTitle("", for: .normal)
        check3.setTitle("", for: .normal)
        check4.setTitle("", for: .normal)
        check5.setTitle("", for: .normal)
        
        subtitle.text = InOutSchoolController.insideSchool ? "In School" : "Out of School"

    }
    
    @IBAction func submitPressed(_ sender: Any) {
        print("Submit button pressed")
    }
    
    func updateCheckTitle(button check: UIButton) {
        if check.currentTitle == "" {
            check.setTitle("☑️", for: .normal)
        } else {
            check.setTitle("", for: .normal)
        }
    }
    @IBAction func check1Pressed(_ sender: Any) {
        updateCheckTitle(button: check1)
        print("Current title of check 1 is: \"\(check1.currentTitle ?? "nil")\"")
    }
    
    @IBAction func check2Pressed(_ sender: Any) {
            updateCheckTitle(button: check2)
            print("Current title of check 2 is: \"\(check2.currentTitle ?? "nil")\"")
    }
    
    @IBAction func check3Pressed(_ sender: Any) {
        updateCheckTitle(button: check3)
        print("Current title of check 3 is: \"\(check3.currentTitle ?? "nil")\"")
    }
    
    
    @IBAction func check4Pressed(_ sender: Any) {
        updateCheckTitle(button: check4)
        print("Current title of check 4 is: \"\(check4.currentTitle ?? "nil")\"")
    }
    
    
    @IBAction func check5Pressed(_ sender: Any) {
        updateCheckTitle(button: check5)
        print("Current title of check 5 is: \"\(check5.currentTitle ?? "nil")\"")
    }
    
    
}

class ProtocolsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var pickerView: UIPickerView!
    let resourcesArray = createResources()
    let cities: [String] = ["Lewisville", "Denton","Plano", "Coppell", "Dallas", "Fort Worth", "Frisco", "Carollton", "Farmers Branch", "Richardson", "Colleyville", "Addison", "Houston", "Canton", "Lemont", "Judsonia"]
    

    @IBOutlet var infoTextView: UITextView!
    @IBOutlet var subtitle: UILabel!
    var inOrOut: String!
    var placementAnswer = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        // Do any additional setup after loading the view.
        
        subtitle.text = InOutSchoolController.insideSchool ? "In School" : "Out of School"
    }
    //Goes to Call Recommended people screen
    @IBAction func CallRecommended(_ sender: Any) {
        var callAdminController: UIViewController!
        if InOutSchoolController.insideSchool {
            callAdminController = storyboard!.instantiateViewController(withIdentifier: "adminInSchool") as! CallAdminInSchoolController
        } else {
            callAdminController = storyboard!.instantiateViewController(withIdentifier: "adminOutSchool") as! CallAdminOutSchoolController
        }
        self.navigationController?.pushViewController(callAdminController, animated: true)
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        placementAnswer = row
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    
    @IBAction func Enter(_ sender: Any) {
        var infoString = ""
        var selectedList: [Resource] = []
        for resource in resourcesArray {
            if resource.city == cities[placementAnswer] {
                selectedList.append(resource)
            }
        }
        
        infoString.append("Resources in \(cities[placementAnswer])\n")
        for resource in selectedList {
            infoString.append(resource.category + "\n")
            infoString.append(resource.name + "\n")
            infoString.append(resource.contact + "\n")
            infoString.append(resource.address + "\n")
            infoString.append(resource.city + "\n")
            infoString.append(resource.state + "\n")
            infoString.append(resource.zip + "\n")
            infoString.append(resource.website + "\n\n")
//            infoString.append(resource.addInfo + "\n\n")
        }
        
        infoTextView.text = infoString
    }
}

//  infolabel.text =
