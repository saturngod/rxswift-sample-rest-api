//
//  Country.swift
//  RxSwiftSample
//
//  Created by Htain Lin Shwe on 14/09/2022.
//

import Foundation

struct CountryModel: Codable {
    let code: Int?
    let result: [CountryListModel]?
    
    private enum CodingKeys: String, CodingKey {
        case code
        case result
    }
}
