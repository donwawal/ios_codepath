//
//  ContactInfoCell.swift
//  ios_codepath
//
//  Created by Jules Walter on 8/9/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class ContactInfoCell: UITableViewCell {

    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var githubLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
