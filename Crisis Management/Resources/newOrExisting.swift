//
//  newOrExisting.swift
//  Crisis Management
//
//  Created by Rushil Patel on 3/7/23.
//

import UIKit

class newOrExisting: UIViewController {
    @IBOutlet weak var newClick: UIButton!
    @IBOutlet weak var existingClick: UIButton!
    @IBOutlet weak var goBac: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        newClick.layer.cornerRadius = 25
        existingClick.layer.cornerRadius = 25
        // Do any additional setup after loading the view.
    }
    @IBAction func existingClicked(_ sender: Any) {
        ResourcesPullDownViewController.newCat = false
        
    }
    
    @IBAction func newClicked(_ sender: Any) {
        ResourcesPullDownViewController.newCat = true
        
    }
    
    @IBAction func goingBac(_ sender: Any) {
        self.dismiss(animated: true)
    }

   //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
              // if let nextViewController = segue.destination as? ResourcesPullDownViewController {
                   // self.dismiss(animated: true)
               // }
       // }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
