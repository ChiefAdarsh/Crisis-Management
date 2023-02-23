//
//  TVC.swift
//  funn
//
//  Created by Rushil Patel on 2/6/23.
//

import UIKit

class TVC: UITableViewCell {

    @IBOutlet weak var someLabel: UILabel!
    @IBOutlet weak var someView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //someView.backgroundColor = UIColor.red.withAlphaComponent(0.25)
        // Configure the view for the selected state
    }
    override func layoutSubviews() {
          super.layoutSubviews()
          //set the values for top,left,bottom,right margins
          let margins = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
          contentView.frame = contentView.frame.inset(by: margins)
          contentView.layer.cornerRadius = 8
    }

}

