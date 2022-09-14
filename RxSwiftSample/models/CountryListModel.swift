//
//  CountryListModel.swift
//  RxSwiftSample
//
//  Created by Htain Lin Shwe on 14/09/2022.
//

import Foundation

struct CountryListModel: Codable {
    let code: String
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case code
        case name
    }
}
