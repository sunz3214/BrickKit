//
//  LegoKitDataSourceUsable.swift
//  AddAction
//
//  Created by 해영 on 2018. 8. 5..
//  Copyright © 2018년 해영. All rights reserved.
//

import Foundation

protocol LegoKitDataSourceUsable: class {
    associatedtype SectionType: SectionEnum
    var dataSource: LegoKitDataSource<SectionType>{ get }
}

protocol SectionEnum: Hashable, CaseIterable {
    
}

extension SectionEnum {
    var value: Int? {
        return Self.allCases.enumerated().first(where: { $0.element == self })?.offset
    }
}

