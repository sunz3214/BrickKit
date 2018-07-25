//
//  LKTitleCell.swift
//  AddAction
//
//  Created by 해영 on 2018. 7. 21..
//  Copyright © 2018년 해영. All rights reserved.
//

import UIKit

struct LKTitleCellModel: LegoKitModel {
    typealias Cell = LKTitleCell
    
    var identifiers: [String] = ["LKTitleCell2","LKTitleCell"]
    var title: String?
    
}

class LKTitleCell: LKBaseCell {
    


    @IBOutlet weak var titleLabel: UILabel!
    
    override func render(by model: LegoKitModel) {
        super.render(by: model)
        
        if let titleModel = model as? LKTitleCellModel {
            titleLabel.text = titleModel.title
        }
    }
}
