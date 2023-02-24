//
//  TableViewCellSHEESH.swift
//  Crisis Management
//
//  Created by Rushil Patel on 2/24/23.
//

import UIKit

class TableViewCellSHEESH: UITableViewCell {

    @IBOutlet weak var labelSheesh: UILabel!
    @IBOutlet weak var viewSHEESH: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

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
