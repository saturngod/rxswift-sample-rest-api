//
//  API.swift
//  RxSwiftSample
//
//  Created by Htain Lin Shwe on 14/09/2022.
//

import Foundation

public enum RequestType: String {
    case GET, POST, PUT,DELETE
}

class APIRequest {
    let baseURL = URL(string: "https://api.printful.com/countries")!
    var method = RequestType.GET
    var parameters = [String: String]()
    
    func request(with baseURL: URL) -> URLRequest {
        var request = URLRequest(url: baseURL)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}
