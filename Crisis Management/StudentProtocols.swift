//
//  StudentProtocols.swift
//  Crisis Management
//
//  Not created by Varshith Peddi on 11/4/22.
//

import UIKit

class ChecklistViewController: UIViewController, BackTitle {

    @IBOutlet var submitButton: UIButton!
    
    @IBOutlet var check1Label: UILabel!
    @IBOutlet var check2Label: UILabel!
    @IBOutlet var check3Label: UILabel!
    @IBOutlet var check4Label: UILabel!
    @IBOutlet var check5Label: UILabel!
    
    @IBOutlet var check1: UIButton!
    @IBOutlet var check2: UIButton!
    @IBOutlet var check3: UIButton!
    @IBOutlet var check4: UIButton!
    @IBOutlet var check5: UIButton!
    var backTitle: String!
    static var situations: [String] = []
    var criterias: [String] {
        var texts: [String] = []
        if !check1.title(for: .normal)!.isEmpty {
            texts.append(check1Label.text!)
        }
        if !check2.title(for: .normal)!.isEmpty {
            texts.append(check2Label.text!)
        }
        if !check3.title(for: .normal)!.isEmpty {
            texts.append(check3Label.text!)
        }
        if !check4.title(for: .normal)!.isEmpty {
            texts.append(check4Label.text!)
        }
        if !check5.title(for: .normal)!.isEmpty {
            texts.append(check5Label.text!)
        }
        return texts
    }
    
    @IBSegueAction func segueAction(_ coder: NSCoder) -> ProtocolsViewController? {
        if check1.title(for: .normal)!.isEmpty && check2.title(for: .normal)!.isEmpty && check3.title(for: .normal)!.isEmpty && check4.title(for: .normal)!.isEmpty && check5.title(for: .normal)!.isEmpty {
            let alertController = UIAlertController(title: "No Criteria Selected", message: "Please check one of the criteria from the checklist", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alertController, animated: true, completion: nil)
        }
        
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
        self.backTitle = "Help A Student - Checklist"
        
        if let ctrs = self.navigationController?.viewControllers, ctrs.count > 1 {
            let viewController = ctrs[ctrs.count - 2] as! BackTitle
            let backButton = UIBarButtonItem()
            backButton.title = viewController.backTitle
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }
        
        check1.setTitle("", for: .normal)
        check2.setTitle("", for: .normal)
        check3.setTitle("", for: .normal)
        check4.setTitle("", for: .normal)
        check5.setTitle("", for: .normal)
        
        subtitle.text = InOutSchoolController.insideSchool ? "In School" : "Out of School"

    }
    
    @IBAction func submitPressed(_ sender: Any) {
        if(selected1 == false){
            check1.backgroundColor = .systemRed
        }
        if(selected2 == false){
            check2.backgroundColor = .systemRed
        }
        if(selected3 == false){
            check3.backgroundColor = .systemRed
        }
        if(selected4 == false){
            check4.backgroundColor = .systemRed
        }
        if(selected5 == false){
            check5.backgroundColor = .systemRed
        }
        if(selected1 == true || selected2 == true || selected3 == true || selected4 == true || selected5 == true){
            check1.backgroundColor = .clear
            check2.backgroundColor = .clear
            check3.backgroundColor = .clear
            check4.backgroundColor = .clear
            check5.backgroundColor = .clear
            ChecklistViewController.situations = criterias
            print("Submit button pressed")
            guard let vc = (storyboard?.instantiateViewController(withIdentifier: "protocol") as? ProtocolsViewController) else{
                print("failed to get vc")
                return
            }
            show(vc, sender: nil)
        }
    }
    
    func updateCheckTitle(button check: UIButton) {
        if check.currentTitle == "" {
            check.setTitle("☑️", for: .normal)
            check1.backgroundColor = .clear
            check2.backgroundColor = .clear
            check3.backgroundColor = .clear
            check4.backgroundColor = .clear
            check5.backgroundColor = .clear
        } else {
            check.setTitle("", for: .normal)
        }
    }
    
    var selected1 = false
    var selected2 = false
    var selected3 = false
    var selected4 = false
    var selected5 = false
    
    @IBAction func check1Pressed(_ sender: Any) {
        updateCheckTitle(button: check1)
        if(selected1 == false){
            selected1 = true
        }
        else{
            selected1 = false
        }
        print("Current title of check 1 is: \"\(check1.currentTitle ?? "nil")\"")
    }
    
    @IBAction func check2Pressed(_ sender: UIButton) {
        updateCheckTitle(button: check2)
        if(selected2 == false){
            selected2 = true
        }
        else{
            selected2 = false
        }
        print("Current title of check 2 is: \"\(check2.currentTitle ?? "nil")\"")
    }
    
    @IBAction func check3Pressed(_ sender: Any) {
        updateCheckTitle(button: check3)
        if(selected3 == false){
            selected3 = true
        }
        else{
            selected3 = false
        }
        print("Current title of check 3 is: \"\(check3.currentTitle ?? "nil")\"")
    }
    
    
    @IBAction func check4Pressed(_ sender: Any) {
        updateCheckTitle(button: check4)
        if(selected4 == false){
            selected4 = true
        }
        else{
            selected4 = false
        }
        print("Current title of check 4 is: \"\(check4.currentTitle ?? "nil")\"")
    }
    
    
    @IBAction func check5Pressed(_ sender: Any) {
        updateCheckTitle(button: check5)
        if(selected5 == false){
            selected5 = true
        }
        else{
            selected5 = false
        }
        print("Current title of check 5 is: \"\(check5.currentTitle ?? "nil")\"")
    }
    
}

class ProtocolsViewController: UIViewController, BackTitle {
    @IBOutlet var inOrOut: UILabel!
    var backTitle: String!
    @IBOutlet var on1: UILabel!
    @IBOutlet var tw2: UILabel!
    @IBOutlet var th3: UILabel!
    @IBOutlet var fo4: UILabel!
    @IBOutlet var fi5: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        inOrOut.text = InOutSchoolController.insideSchool ? "In School" : "Out of School"
        self.backTitle = "Help A Student - Protocols"
        on1.text = "Children’s Medical Center\n1935 Medical District Drive\nDallas, TX 75235\n214-456-8899 "
        tw2.text = "Parkland Hospital (ER)\n5200 Harry Hines\nDallas, TX 75235\n214-590-8000"
        th3.text = "Seay Center - Texas Health\n6110 W. Parker Road\nPlano, TX 75093\n972-981-8301"
        fo4.text = "Holiner Psychiatric Group\n7777 Forest Lane Building Suite 833\nDallas, TX 75230-2501\n972-566-4591"
        fi5.text = "Excel Center of Lewisville\n190 Civic Circle #170\nLewisville, TX 75067\n972-906-5522"
        if let ctrs = self.navigationController?.viewControllers, ctrs.count > 1 {
            let viewController = ctrs[ctrs.count - 2] as! BackTitle
            let backButton = UIBarButtonItem()
            backButton.title = viewController.backTitle
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        }
    }
    
    // Goes to Call Recommended people screen

    @IBAction func CallRecommended(_ sender: Any){
         var callAdminController: UIViewController!
        if InOutSchoolController.insideSchool {
            callAdminController = storyboard!.instantiateViewController(withIdentifier: "adminInSchool") as! CallAdminInSchoolController
        } else {
            callAdminController = storyboard!.instantiateViewController(withIdentifier: "adminOutSchool") as! CallAdminOutSchoolController
        }
        self.navigationController?.pushViewController(callAdminController, animated: true)
    }
}
