//
//  ReportIssue.swift
//  Crisis Management
//
//  Created by Mukund K Raman on 11/7/22.
//

import UIKit

class ReportIssueController: UIViewController {
    
    /* Variables from Interface Builder */
    
    @IBOutlet var inOrOut: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        inOrOut.text = InOutSchoolController.insideSchool ? "In School" : "Out of School"
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
