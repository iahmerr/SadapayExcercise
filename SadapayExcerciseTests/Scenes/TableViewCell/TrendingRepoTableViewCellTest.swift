//
//  TrendingRepoTableViewCellTest.swift
//  SadapayExcerciseTests
//
//  Created by Ahmer Hassan on 21/07/2022.
//

import XCTest
@testable import SadapayExcercise

class TrendingRepoTableViewCellTest: XCTestCase {
    
    var sut: TrendingRepoTableViewCellViewModel?
    
    override func setUp() {
        let mockedData = APIServiceMocked()
        mockedData.getGitTrendingRepo {[weak self] result in
            switch result {
            case .success(let response):
                self?.sut = TrendingRepoTableViewCellViewModel(item: response.items![0])
            case .failure(let error):
                print("error \(error.error)")
            }
        }
    }
    
    func test_Outputs() {
        
        sut?.postDataClosure = {val1, val2, val3, val4, val5 in
            XCTAssertNotNil(val1)
            XCTAssertEqual(val1, "LayaAir")
            XCTAssertNotNil(val2)
            XCTAssertEqual(val2, "LayaAir is an open-source 2D/3D engine. LayaAir Engine is designed for high performance games.LayaAir support TypeScript and JavaScript、ActionScript 3.0 programming language.Can develop once, publish for multi platform.")
            XCTAssertNotNil(val3)
            XCTAssertEqual(val3, "TypeScript")
            XCTAssertNotNil(val4)
            XCTAssertEqual(val4, " ⭐️ 1141")
            XCTAssertNotNil(val5)
            XCTAssertEqual(val5,URL(string: "https://avatars.githubusercontent.com/u/11814868?v=4"))
        }
        sut?.fetchData()
    }

}
