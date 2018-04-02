//
//  DTCViewCell.swift
//  DTC Monitor
//
//  Created by Gokhan Cengiz on 2.04.2018.
//  Copyright © 2018 Gokhan Cengiz. All rights reserved.
//

import UIKit

class DTCViewCell: UITableViewCell {

    @IBOutlet weak var CellCodeView: UILabel!
    @IBOutlet weak var CellTitleView: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepareDTCView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    fileprivate func prepareDTCView(){
        
    }
    
}
