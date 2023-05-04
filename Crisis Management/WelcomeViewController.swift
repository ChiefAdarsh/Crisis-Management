//
//  Onboarding-v2ViewController.swift
//  Student Central v2
//
//  Created by Omesh Reddy Sana on 4/26/23.
//

import UIKit

class Onboarding_v2ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var backButton: UIButton!
    
    var num = 0
    
    let images = ["Onboarding_1.jpeg", "MicrosoftTeams.jpeg", "pencil", "doc.fill.badge.plus", "list.bullet.rectangle.portrait.fill", "phone.fill", "info.circle.fill"]
    let titles = ["Welcome", "Teams", "In/Out of School", "Report An Issue", "Help A Student", "Call An Admin", "Resources"]
            
    let taglines = ["Our app is a centralized system that lets teachers do everything if they spot a student in crisis. Teachers can ultize multiple features of the apps to help out a student in distress.", "This app uses Microsoft Teams to make calls. Please make sure to set up Teams on your device before you call.", "Teachers should choose either the \"In School\" or \"Out of School\" option based on when and where they need to use the app for a student.", "Enter the student's, teacher's, and their respective counselor's information and click report and send the email to report a student in distress.", "Check the proper criterias and click submit for advice on how to deal with the crisis.", "Upload the provided .txt file by clicking the upload button then click the principal or counselor button.", "Select the necessary resource category then select the resources you need. Click Add resources and create a new category or click existing category to add a resource to an existing category."]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.font = UIFont(name: "Helvetica-Bold", size: 36)
        descriptionLabel.font = UIFont(name: "Helvetica", size: 22)
        skipButton.setTitleColor(.systemBlue, for: .normal)
        skipButton.setTitle("Skip", for: .normal)
        skipButton.titleLabel?.font =  UIFont(name: "Helvetica", size: 35)
        skipButton.layer.cornerRadius = 10
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.backgroundColor = .black
        nextButton.setTitle("Next", for: .normal)
        nextButton.layer.cornerRadius = 10
        backButton.setTitleColor(.white, for: .normal)
        backButton.backgroundColor = .black
        backButton.setTitle("Back", for: .normal)
        backButton.layer.cornerRadius = 10
        
        backButton.isHidden = true
        
        imageView.image = UIImage(named: images[0])
        titleLabel.text = titles[0]
        descriptionLabel.text = taglines[0]
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        let config = UIImage.SymbolConfiguration(paletteColors: [UIColor(red: 176/255.0, green: 3/255.0, blue: 0/255.0, alpha: 1.0)])
        if num != 0{
            backButton.isHidden = false
        }
        
        if num <= images.count - 1{
            num += 1
            if num == 6{
                imageView.image = UIImage(systemName: images[num])
                nextButton.setTitle("Get Started", for: .normal)
//
            }
            else if num > 6{
                dismiss(animated: true, completion: nil)

            }
            else
            {
                imageView.image = UIImage(systemName: images[num])
                nextButton.setTitle("Next", for: .normal)
                
            }
            if num == 1{
                imageView.image = UIImage(named: images[num])
            }
            if num != 0{
                backButton.isHidden = false
            }
            if num == 0 {
                backButton.isHidden = true
                imageView.image = UIImage(named: images[num])
            }
            titleLabel.text = titles[num]
            descriptionLabel.text = taglines[num]
            pageControl.currentPage = num
            if (num == 6)
            {
                num += 1
            }
            //num += 1
        }
        else{
            
//            if (num == 7 && backButton.isEnabled){
//                print("hello")
//                num -= 1
//            }
//            else{
//                dismiss(animated: true, completion: nil)
//            }
            Core.shared.setIsNotNewUser()
            dismiss(animated: true, completion: nil)
        }
        imageView.preferredSymbolConfiguration = config
        
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        let config = UIImage.SymbolConfiguration(paletteColors: [UIColor(red: 176/255.0, green: 3/255.0, blue: 0/255.0, alpha: 1.0)])
        num -= 1
        if (num == 6)
        {
            num -= 1
        }
        if num <= images.count - 1{
            //num -= 1
            backButton.isHidden = false
            if (num == 0){
                imageView.image = UIImage(named: images[num])
            }
            else if (num == 6){
                imageView.image = UIImage(systemName: images[num])
                nextButton.setTitle("Get Started", for: .normal)
            }
            else
            {
                imageView.image = UIImage(systemName: images[num])
            }
            
            titleLabel.text = titles[num]
            descriptionLabel.text = taglines[num]
            pageControl.currentPage = num
            num -= 1
            if (num == 0){
                backButton.isHidden = true

            }
        }
        
        imageView.preferredSymbolConfiguration = config

    }
    
    @IBAction func skipButton(_ sender: Any) {
        Core.shared.setIsNotNewUser()
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
