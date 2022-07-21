//
//  TestApiService.swift
//  SadapayExcerciseTests
//
//  Created by Ahmer Hassan on 21/07/2022.
//

import XCTest
@testable import SadapayExcercise

class TestApiService: XCTestCase {

    let sut = APIServiceMocked()
    
    func test_apiServiceMockedSuccess() {
        var response: GitReposResponse?
        
        sut.getGitTrendingRepo { result in
            switch result {
            case .success(let data):
                response = data
            case .failure(let err):
                print("err", err.localizedDescription)
            }
        }
        XCTAssertNotNil(response)
        XCTAssertEqual(response?.total_count, 523)
        XCTAssertFalse(response!.items!.isEmpty)
        XCTAssertEqual(response?.items?.count, 25)
    }
    
    func test_test_apiServiceMockedFailure() {
        var response: GitReposResponse?
        var error: AppError?
        
        sut.isFailure = true
        
        sut.getGitTrendingRepo { result in
            switch result {
            case .success(let result):
                response = result
            case .failure(let err):
                error = err
            }
        }
        
        XCTAssertNil(response)
        XCTAssertNotNil(error)
        XCTAssertEqual(AppError(error: "Error Occured"), error)
    }
    
}
