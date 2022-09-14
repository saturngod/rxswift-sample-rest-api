//
//  RxSwiftSampleTests.swift
//  RxSwiftSampleTests
//
//  Created by Htain Lin Shwe on 14/09/2022.
//

import XCTest
import RxSwift
import RxTest
import RxBlocking

@testable import RxSwiftSample

final class RxSwiftSampleTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCountryAPI() throws {
        let apiCalling = APICalling()
        let request =  APIRequest()
        let result : Observable<CountryModel> = apiCalling.callAPI(apiRequest: request)
        
        let res = try result.toBlocking().toArray()
        XCTAssertTrue(res[0].result?.count == 245)
    }
    
    func testCountryName() throws {
        let apiCalling = APICalling()
        let request =  APIRequest()
        let result : Observable<CountryModel> = apiCalling.callAPI(apiRequest: request)
        
        let res = try result.toBlocking().toArray()
        
        XCTAssertEqual(res[0].result?[0].name, "Andorra")
        XCTAssertEqual(res[0].result?[0].code, "AD")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
