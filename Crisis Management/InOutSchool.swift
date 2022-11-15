//
//  ViewController.swift
//  Crisis Management
//
//  Created by Adarsh Goura on 11/1/22.
//

import UIKit

class InOutSchoolController: UIViewController, BackTitle {
    
    /* Variables from Interface Builder */
    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet var cisdLogo: UIImageView!
    
    @IBOutlet var reportIssueLabel: UILabel!
    @IBOutlet var reportSubtitleLabel: UILabel!
    
    @IBOutlet var settingsButton: UIBarButtonItem!
    @IBOutlet var inSchoolButton: UIButton!
    @IBOutlet var outSchoolButton: UIButton!
    
    @IBOutlet var stackView: UIStackView!
    var backTitle: String!
    
    // Home View Controller
    var homeViewController: HomeViewController!
    static var insideSchool: Bool!
    
    // When the view is initially loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        let size = UIScreen.main.bounds.size
        if size.height < size.width {
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
    @IBSegueAction func settingsSegueAction(_ coder: NSCoder, sender: UIBarButtonItem?) -> SettingsController? {
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
