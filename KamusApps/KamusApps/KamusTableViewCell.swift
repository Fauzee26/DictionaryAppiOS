
//
//  KamusTableViewCell.swift
//  KamusApps
//
//  Created by Muhammad Hilmy Fauzi on 9/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class KamusTableViewCell: UITableViewCell {

    @IBOutlet weak var labelNomor: UILabel!
    @IBOutlet weak var labelIndo: UILabel!
    @IBOutlet weak var labelInggris: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
