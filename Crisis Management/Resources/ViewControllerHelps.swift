//
//  ViewControllerMEEE.swift
//  funn
//
//  Created by Rushil Patel on 2/7/23.
//

import UIKit

class HelpViewController: UIViewController {
    

    var wordd : String = ""
    var mt = Set<String>()
    var empty = [String]()
    @IBOutlet weak var sheesh: UITableView!
    
    
    @IBOutlet var stackView: UIStackView!
    
    
    
    
    @IBAction func housingTap(_ sender: Any) {
        wordd = "Housing"
    }
    @IBAction func shelterTap(_ sender: Any) {
        wordd = "Shelter"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sheesh.delegate = self
        sheesh.dataSource = self
        wordd = ""
        for yeahh in yourArray{
            mt.insert(yeahh.category)
        }
        for okayy in mt{
            empty.append(okayy)
        }
        let size = UIScreen.main.bounds.size
        if size.height < size.width {
            stackView.axis = .horizontal
        } else {
            stackView.axis = .vertical
        }
        sheesh.separatorStyle = .none
        // Do any additional setup after loading the view.
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        guard let _ = stackView else { return }
        
        if UIDevice.current.orientation.isLandscape {
            stackView.axis = .horizontal
        } else {
            stackView.axis = .vertical
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if let nextViewController = segue.destination as? ViewControllerResPage {
                    nextViewController.order = wordd
                }
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
extension HelpViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return empty.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = sheesh.dequeueReusableCell(withIdentifier: "SHOOOSH") as! TableViewCellSHEESH
        
        
        cell2.labelSheesh.text = empty[indexPath.row]
        
        return cell2
    }
    
    
    
    
}
