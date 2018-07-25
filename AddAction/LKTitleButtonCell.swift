//
//  LKTitleButtonCell.swift
//  AddAction
//
//  Created by 해영 on 2018. 7. 21..
//  Copyright © 2018년 해영. All rights reserved.
//

import UIKit

struct LKTitleButtonCellModel: LegoKitModel {
    
//    var identifiers: [String] = ["LKTitleButtonCell"]
    var actions: [() -> ()]?
    func addActions(action: @escaping () -> ()) {
        
    }
}
class LKTitleButtonCell: LKBaseCell {
    @IBOutlet weak var actionButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
