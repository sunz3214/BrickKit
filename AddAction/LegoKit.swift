//
//  LegoKit.swift
//  AddAction
//
//  Created by 해영 on 2018. 7. 21..
//  Copyright © 2018년 해영. All rights reserved.
//

import UIKit

class LegoKitDataSource<SectionType: CaseIterable>: NSObject {
typealias Items<SectionType> = (SectionType) -> Section
    class Section {
        var items: [LegoKitModel]
        init(items: [LegoKitModel]) {
            self.items = items
        }
    }

    var items: Items<SectionType>? {
        didSet {
            updateSection()
        }
    }
    var sections = [Section]()
    func updateSection() {

        sections = SectionType.allCases.compactMap {
            self.items?($0)
        }
    }
    

    func numberOfRows(in section: Int) -> Int {
        if section < sections.count {
            let section = sections[section]
            return section.items.count
        } else {
            return 0
        }
    }
    
    func item(at indexPath: IndexPath) -> LegoKitModel? {
        if indexPath.section < sections.count {
            let section = sections[indexPath.section]
            
            if indexPath.row < section.items.count {
                let row = section.items[indexPath.row]
                
                return row
            }
        }
        
        return nil
    }
    
    func cell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let item = item(at: indexPath) else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: item.identifier, for: indexPath)
        (cell as? LKCellPreRender)?.preRender(by: item)
        return cell
    }
    

    
}

protocol LegoKitModel {
    var cellType: UITableViewCell.Type { get }
    func addActions(action: ()->())

}

extension LegoKitModel {

    var identifier: String {
       return "\(cellType)"
    }
    func addActions(action: () -> ()) { }
    
   
}

protocol LKCellPreRender {
     func preRender(by model: LegoKitModel)
}

protocol LKCellProcotol: LKCellPreRender where Self: UITableViewCell {
    associatedtype Model: LegoKitModel
    func render(by model: Model)
}

extension LKCellProcotol {
    func preRender(by model: LegoKitModel) {
        if let matchedModel = model as? Model {
            self.render(by: matchedModel)
        }
    }
}


class ClosureSleeve {
    let closure: ()->()
    
    init (_ closure: @escaping ()->()) {
        self.closure = closure
    }
    
    @objc func invoke () {
        closure()
    }
}

extension UIControl {
    func add (for controlEvents: UIControlEvents, _ closure: @escaping ()->()) {
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, String(format: "[%d]", arc4random()), sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}



