//
//  TestDecodeData.swift
//  SadapayExcerciseTests
//
//  Created by Ahmer Hassan on 21/07/2022.
//

import Foundation
import XCTest
@testable import SadapayExcercise

class TestDecodeData: XCTestCase {
    
    func test_ResponseModel() throws {
        guard let pathString = Bundle(for: type(of: self)).path(forResource: "TrendingRepoResponse", ofType: "json") else {
            fatalError("File not found")
        }
        
        guard let json = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            fatalError("Unable to convert to json")
        }
        
        let jsonData = json.data(using: .utf8)!
        let decodedResult = try? JSONDecoder().decode(GitReposResponse.self, from: jsonData)
        
        XCTAssertNotNil(decodedResult)
        XCTAssertEqual(decodedResult?.total_count, 523)
        XCTAssertEqual(decodedResult?.items?[0].name, "LayaAir")
        XCTAssertEqual(decodedResult?.items?[0].owner?.avatar_url, "https://avatars.githubusercontent.com/u/11814868?v=4")
        XCTAssertEqual(decodedResult?.items?[0].language, "TypeScript")
        XCTAssertEqual(decodedResult?.items?[0].stargazers_count, 1141)
    }
}
