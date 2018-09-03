//
//  ViewController.swift
//  AddAction
//
//  Created by 해영 on 2018. 7. 20..
//  Copyright © 2018년 해영. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LegoKitDataSourceUsable {
    enum SectionType: SectionEnum {
        case top
        case bottom
    }

    @IBOutlet weak var tableView: UITableView!
    var dataSource = LegoKitDataSource<SectionType>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dataSource.items = { sectionType -> LegoKitDataSource<SectionType>.Section in
            var items = [LegoKitModel]()
            
            func addItem(title: String) {
                var titleModel = LKTitleCellModel()
                titleModel.title = title
                items.append(titleModel)
            }

            switch  sectionType {
            case .top:
                addItem(title: "제목 추가")
                addItem(title: "제목 추가2")
                addItem(title: "제목 추가3")
                return LegoKitDataSource.Section(items: items)
            default:
                
                addItem(title: "하단 내용")
                return LegoKitDataSource.Section(items: items)
                
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  

}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.numberOfRows(in: section)
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dataSource.cell(tableView:tableView, indexPath: indexPath)
    }
    
}
