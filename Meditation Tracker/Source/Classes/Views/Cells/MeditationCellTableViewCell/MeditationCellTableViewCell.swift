//
//  TableViewCell.swift
//  Meditation Tracker
//
//  Created by MACBOOK on 21.12.16.
//  Copyright © 2016 MACBOOK. All rights reserved.
//

import UIKit

class MeditationCellTableViewCell: UITableViewCell {

    @IBOutlet weak var nameOfMeditation: UILabel!
    @IBOutlet weak var countOfMeditation: UILabel!
    @IBOutlet weak var imageForMeditation: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
