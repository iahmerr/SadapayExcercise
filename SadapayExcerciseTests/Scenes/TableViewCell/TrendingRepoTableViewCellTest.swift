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
        
        sut?.postDataClosure = {val1, val2, val3, val4 in
            XCTAssertNotNil(val1)
            XCTAssertEqual(val1, "LayaAir")
            XCTAssertNotNil(val2)
            XCTAssertEqual(val2, "https://api.github.com/repos/layabox/LayaAir")
            XCTAssertNotNil(val3)
            XCTAssertEqual(val3, "layabox/LayaAir")
            XCTAssertNotNil(val4)
            XCTAssertEqual(val4, "https://avatars.githubusercontent.com/u/11814868?v=4")
        }
        sut?.fetchData()
    }

}
