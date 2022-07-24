//
//  RepoListViewModelTest.swift
//  SadapayExcerciseTests
//
//  Created by Ahmer Hassan on 21/07/2022.
//

import XCTest
@testable import SadapayExcercise

class RepoListViewModelTest: XCTestCase {

    let sut = TrendingRepoListViewModel(apiService: APIServiceMocked())
    
    func test_ControllerTitle() {
        XCTAssertNotNil(sut.getTitle())
        XCTAssertEqual(sut.getTitle(), "Trending")
    }
    
    func test_ShimmeringCells() {
        sut.createShimmerCells()
        XCTAssertEqual(sut.dataSourceArray.count, 11)
        XCTAssertNotNil(sut.getNumberOfCells(for:0))
        XCTAssertEqual(sut.getNumberOfCells(for: 0), 11)
    }
    
    func test_TableViewNumOfCells() {
        sut.fetchGitRepos()
        XCTAssertEqual(sut.dataSourceArray.count, 25)
        XCTAssertNotNil(sut.getNumberOfCells(for:0))
        XCTAssertEqual(sut.getNumberOfCells(for: 0), 25)
    }
}
