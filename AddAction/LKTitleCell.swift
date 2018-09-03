//
//  LKTitleCell.swift
//  AddAction
//
//  Created by 해영 on 2018. 7. 21..
//  Copyright © 2018년 해영. All rights reserved.
//

import UIKit

struct LKTitleCellModel: LegoKitModel {
    var cellType: UITableViewCell.Type = LKTitleCell.self
    var title: String?
    
}

class LKTitleCell: UITableViewCell, LKCellProcotol {

    @IBOutlet weak var titleLabel: UILabel!
    
     func render(by model: LKTitleCellModel) {
    
            titleLabel.text = model.title
        
    }
}
