//
//  LocHelpViewController.swift
//  Crisis Management
//
//  Created by Adarsh Goura on 11/4/22.
//

import UIKit

class LocHelpViewController: UIViewController {

    /* Variables from Interface Builder */
    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet var cisdLogo: UIImageView!
    
    @IBOutlet var reportIssueLabel: UILabel!
    @IBOutlet var reportSubtitleLabel: UILabel!
    
    @IBOutlet var settingsButton: UIBarButtonItem!
    
    @IBOutlet var homeButton: UIButton!
    @IBOutlet var inSchoolButton: UIButton!
    @IBOutlet var outSchoolButton: UIButton!
    
    @IBOutlet var stackView: UIStackView!
    
    // In School View Controller
    var checklistController: ChecklistViewController!
    
    // When the view is initially loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        if UIDevice.current.orientation.isLandscape {
            stackView.axis = .horizontal
        } else {
            stackView.axis = .vertical
        }
    }
    
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
    }

    /* Actions for buttons from Interface Builder */
    
    // When the settings button is pressed
    @IBAction func settingsPressed(_ sender: Any) {
        print("Settings button pressed")
    }
    
    // When the home button is pressed
    @IBAction func homePressed(_ sender: Any) {
        print("Home button pressed")
    }
    
    // When the In School button is pressed
    @IBSegueAction func inSchoolSegueAction(_ coder: NSCoder, sender: UIButton?) -> ChecklistViewController? {
        return ChecklistViewController(coder: coder, inOrOut: "In School")
    }
    
    // When the Out of School button is pressed
    @IBSegueAction func outSchoolSegueAction(_ coder: NSCoder, sender: UIButton?) -> ChecklistViewController? {
        return ChecklistViewController(coder: coder, inOrOut: "Out of School")
    }
    

}
