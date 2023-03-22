//
//  ViewController.swift
//  Crisis Management
//
//  Created by Adarsh Goura on 11/1/22.
//

import UIKit

class InOutSchoolController: UIViewController, BackTitle {
    
    /* Variables from Interface Builder */
    
    @IBOutlet var importDatabaseButton: UIButton!
    @IBOutlet var importCsvFiles: UIButton!
    @IBOutlet var manuallyImport: UIButton!
    
    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet var cisdLogo: UIImageView!
    
    @IBOutlet var reportIssueLabel: UILabel!
    @IBOutlet var reportSubtitleLabel: UILabel!
    
    @IBOutlet var settingsButton: UIBarButtonItem!
    @IBOutlet var inSchoolButton: UIButton!
    @IBOutlet var outSchoolButton: UIButton!
    
    @IBOutlet var stackView: UIStackView!
    var backTitle: String!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // Home View Controller
    var homeViewController: HomeViewController!
    static var insideSchool: Bool!
    
    
    @IBAction func downloadImportFiles(_ sender: Any) {
        importDatabaseButton.isHidden = false
        importCsvFiles.isHidden = false
        manuallyImport.isHidden = false
    }
    
    // When the view is initially loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        let size = UIScreen.main.bounds.size
        if size.height < size.width {
            stackView.axis = .horizontal
        } else {
            stackView.axis = .vertical
        }
        inSchoolButton.layer.cornerRadius = 25
        inSchoolButton.layer.masksToBounds = true
        
        outSchoolButton.layer.cornerRadius = 25
        outSchoolButton.layer.masksToBounds = true

        importDatabaseButton.isHidden = true
        importCsvFiles.isHidden = true
        manuallyImport.isHidden = true
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (!appDelegate.hasAlreadyLaunched) {
            appDelegate.sethasAlreadyLaunched()
            teamsAlert()
//            onboardingAlerts()
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        if !isAppAlreadyLaunchedOnce() {
//            teamsAlert()
//        }
//    }

    // Change layout of in and out of school buttons to vertical
    // or horizontal based on device orientation
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        guard let _ = stackView else { return }
        
        if UIDevice.current.orientation.isLandscape {
            stackView.axis = .horizontal
        } else {
            stackView.axis = .vertical
        }
        print(appDelegate.hasAlreadyLaunched!)
//        if(!appDelegate.hasAlreadyLaunched){
//            //set hasAlreadyLaunched to false
//            appDelegate.sethasAlreadyLaunched()
//            //display teams alert
//            teamsAlert()
//        }
    }

    // Show Teams Alert
    func teamsAlert() {
        let alertController = UIAlertController(title: "Calls", message:
                "This app uses Microsoft Teams to make calls. Please make sure to set up Teams on your device before you call.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Next", style: .default, handler: {action in
            self.reportAlert()
        }))

        self.present(alertController, animated: true, completion: nil)
    }
    
    func reportAlert() {
        let alertController1 = UIAlertController(title: "Report an Issue", message:
                "Enter the student's, teacher's, and their respective counselor's information and click report and send the email.", preferredStyle: .alert)
        alertController1.addAction(UIAlertAction(title: "Next", style: .default, handler: {action in
            self.helpAlert()
        }))

        self.present(alertController1, animated: true, completion: nil)
    }
    
    func helpAlert() {
        let alertController2 = UIAlertController(title: "Help a Student", message:
                "Check the proper criterias and click submit for advice on how to deal with the crisis.", preferredStyle: .alert)
        alertController2.addAction(UIAlertAction(title: "Next", style: .default, handler: {action in
            self.callAdminAlert()
        }))
        self.present(alertController2, animated: true, completion: nil)
    }
    
    func callAdminAlert() {
        let alertController3 = UIAlertController(title: "Call an Admin", message:
                "Upload the provided .txt file by clicking the upload button then click the principal or counselor button.", preferredStyle: .alert)
        alertController3.addAction(UIAlertAction(title: "Next", style: .default, handler: {action in
            self.resourcesAlert()
        }))

        self.present(alertController3, animated: true, completion: nil)
    }
    
    func resourcesAlert() {
        let alertController4 = UIAlertController(title: "Resources", message:
                "Select the necessary resource category then select the resources you need.\nClick Add resources and create a new category or click existing category to add a resource to an existing category.", preferredStyle: .alert)
        alertController4.addAction(UIAlertAction(title: "Done", style: .default))

        self.present(alertController4, animated: true, completion: nil)
    }
    /* Actions for buttons from Interface Builder */
    
    // When the settings button is pressed
    @IBSegueAction func settingsSegueAction(_ coder: NSCoder, sender: Any?) -> SettingsController? {
        self.backTitle = "Select Location"
        return SettingsController(coder: coder)
    }
    
    
    // When the In School button is pressed
    @IBSegueAction func inSchoolSegueAction(_ coder: NSCoder, sender: UIButton?) -> HomeViewController? {
        self.backTitle = "In School"
        InOutSchoolController.insideSchool = true
        return HomeViewController(coder: coder)
    }
    
    // When the Out of School button is pressed
    @IBSegueAction func outSchoolSegueAction(_ coder: NSCoder, sender: UIButton?) -> HomeViewController? {
        self.backTitle = "Out of School"
        InOutSchoolController.insideSchool = false
        return HomeViewController(coder: coder)
    }
}

protocol BackTitle {
    var backTitle: String! { get set }
}
