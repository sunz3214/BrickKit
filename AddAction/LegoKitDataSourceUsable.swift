//
//  LegoKitDataSourceUsable.swift
//  AddAction
//
//  Created by 해영 on 2018. 8. 5..
//  Copyright © 2018년 해영. All rights reserved.
//

import Foundation
typealias SectionEnum = EnumCollection & SectionTypeProtocol

protocol LegoKitDataSourceUsable: class {
    associatedtype SectionType: SectionEnum
    var dataSource: LegoKitDataSource<SectionType>{ get }
}


protocol SectionTypeProtocol {
    static var sections: [Int] { get }
    var rawValue: Int? { get }
}

extension SectionTypeProtocol where Self: EnumCollection {
    static var sections: [Int] {
        return self.allValues.enumerated().compactMap{ $0.offset }
    }
    
    static func `init`(rawValue: Int) -> Self {
        return Self.allValues[rawValue]
    }
    
    var rawValue: Int? {
        return Self.allValues.enumerated().first(where: { _, element in
            element == self
        })?.offset
    }
}
