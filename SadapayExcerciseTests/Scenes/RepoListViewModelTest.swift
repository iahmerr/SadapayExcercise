//
//  RepoListViewModelTest.swift
//  SadapayExcerciseTests
//
//  Created by Ahmer Hassan on 21/07/2022.
//

import XCTest
@testable import SadapayExcercise

class RepoListViewModelTest: XCTestCase {

    let sut = TrendingRepoListViewModel()
    
    func test_ControllerTitle() {
        XCTAssertNotNil(sut.getTitle())
        XCTAssertEqual(sut.getTitle(), "Trending Repo")
    }

}
