//
//  TestEndpoint.swift
//  SadapayExcerciseTests
//
//  Created by Ahmer Hassan on 21/07/2022.
//

import XCTest
@testable import SadapayExcercise

class TestEndpoint: XCTestCase {

    func test_FetchRepoEndpoint() {
        let sut: Endpoint = Endpoint(route: .getTrendingRepositories, method: .get, queryItems: ["q": "language%3D+sort:stars"])
        XCTAssertNotNil(try sut.urlRequest())
        XCTAssertNotNil(try sut.urlRequest()?.url)
        guard let finalURL = try? sut.urlRequest()?.url?.absoluteString else { return }
        XCTAssertEqual(finalURL, "https://api.github.com/search/repositories?q=language%253D+sort:stars")
        XCTAssertNotNil(try sut.urlRequest()?.httpMethod)
        XCTAssertEqual(try sut.urlRequest()?.httpMethod?.lowercased(), "get")
    }
}
