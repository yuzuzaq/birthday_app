//
//  TableViewCell.swift
//  sampler1
//
//  Created by 森川彩音 on 2019/01/20.
//  Copyright © 2019年 森川彩音. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellnameLabel: UILabel!
    @IBOutlet weak var cellmonthLabel: UILabel!
    @IBOutlet weak var celldayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
