//
//  ViewController.swift
//  AddAction
//
//  Created by 해영 on 2018. 7. 20..
//  Copyright © 2018년 해영. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataSource: LegoKitDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dataSource = LegoKitDataSource(sections: [self.sections(idx: 0)])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func sections(idx: Int) -> LegoKitDataSource.Section {
        
        var items = [LegoKitModel]()
        
        func addItem(title: String) {
            var titleModel = LKTitleCellModel()
            titleModel.title = title
            items.append(titleModel)
        }
        

        addItem(title: "제목 추가")
        addItem(title: "제목 추가2")
        addItem(title: "제목 추가3")
        var buttonModel = LKTitleButtonCellModel()
        
        
        items.append(buttonModel)
        
        
        let section = LegoKitDataSource.Section(items: items)
        return section
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
        let cell = dataSource.cell(tableView: tableView, indexPath: indexPath)

//        if let atcell = cell as? ATBaseCell {
//            print(atcell)
//        }
        

        return cell
    }
    
}
