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
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
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
        inSchoolButton.layer.cornerRadius = 25
        inSchoolButton.layer.masksToBounds = true
        
        outSchoolButton.layer.cornerRadius = 25
        outSchoolButton.layer.masksToBounds = true

        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if Core.shared.isNewUser() {
            // show onboarding
            let vc = storyboard?.instantiateViewController(identifier: "welcome") as! WelcomeViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
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
}

class Core {
    static let shared = Core()
    
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    ///
    func setIsNotNewUser() {
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}

protocol BackTitle {
    var backTitle: String! { get set }
}



