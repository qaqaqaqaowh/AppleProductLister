//
//  iPhoneTableViewCell.swift
//  AppleProduct
//
//  Created by NEXTAcademy on 10/27/17.
//  Copyright © 2017 asd. All rights reserved.
//

import UIKit

class iPhoneTableViewCell: UITableViewCell {
    @IBOutlet weak var appleImageView: UIImageView!
    
    @IBOutlet weak var productLabel: UILabel!

    @IBOutlet weak var launchDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
