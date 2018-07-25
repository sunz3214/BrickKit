//
//  LegoKit.swift
//  AddAction
//
//  Created by 해영 on 2018. 7. 21..
//  Copyright © 2018년 해영. All rights reserved.
//

import UIKit

class LegoKitDataSource {
    class Section {
        var items: [LegoKitModel]
        init(items: [LegoKitModel]) {
            self.items = items
        }
    }
    
    var sections: [Section]
    
    init(sections: [Section]) {
        self.sections = sections
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
    
    func cell(tableView: UITableView, indexPath: IndexPath) -> LKBaseCell {
        guard let item = item(at: indexPath) else { return LKBaseCell() }
        
        let cell = item.identifiers.first(where: { id in tableView.dequeueReusableCell(withIdentifier: id) != nil
        }).map { id in
            tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
            } as? LKBaseCell
        
        cell?.render(by: item)
        return cell ?? LKBaseCell()
    }
    
}

protocol LegoKitModel {
    var identifiers: [String] { get }
    func addActions(action: ()->())
}

extension LegoKitModel {
    var identifiers: [String] {
        get {
            //todo remove
            return [""]
        }
    }
    func addActions(action: () -> ()) { }
}



protocol LKCellProcotol: class {
    func render(by model: LegoKitModel)
}

extension LKCellProcotol where Self: UITableViewCell {
    
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


