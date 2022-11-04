//
//  ViewController.swift
//  reportissue
//
//  Created by Riva Mathur on 11/2/22.
//

import UIKit

class HelpProtocolViewController: UIViewController {
    
    
    @IBOutlet var pickerView: UIPickerView!
    
    let resourcesArray = createResources()
    
    let cities: [String] = ["Lewisville", "Denton","Plano", "Coppell", "Dallas", "Fort Worth", "Frisco", "Carollton", "Farmers Branch", "Richardson", "Colleyville", "Addison", "Houston", "Canton", "Lemont", "Judsonia"]
    

    @IBOutlet var infoTextView: UITextView!
    
    
    var placementAnswer = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        placementAnswer = row
    }
    
}

extension HelpProtocolViewController: UIPickerViewDelegate, UIPickerViewDataSource
{
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
