//
//  ATKit.swift
//  AddAction
//
//  Created by 해영 on 2018. 7. 25..
//  Copyright © 2018년 해영. All rights reserved.
//

import UIKit

protocol ATModelTextProvider {
    var textMap: [String: String] { get set }
}


protocol ATViewModel {
    var identifier: String { get set }
}

extension ATViewModel {
    func getCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        return tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
}


protocol ATBaseCell where Self: UITableViewCell {
    associatedtype CellModel
    func render(model: CellModel)
}


struct ATTitleCellModel: ATViewModel, ATModelTextProvider {
    var identifier: String = "ATTitleCell"

    var textMap: [String : String] = ["k":"v"]
    
}

class ATTitleCell: UITableViewCell, ATBaseCell {
    typealias CellModel = ATTitleCellModel
    
    func render(model: CellModel) {
    

    }
}


