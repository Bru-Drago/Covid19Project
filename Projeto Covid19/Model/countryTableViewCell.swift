//
//  countryTableViewCell.swift
//  Projeto Covid19
//
//  Created by Bruna Fernanda Drago on 20/07/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import UIKit

class countryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var countryNameLbl: UILabel!
    
    @IBOutlet weak var casesConfirmedLbl: UILabel!
    
    @IBOutlet weak var deathConfirmedLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
