//
//  AppErrorTest.swift
//  SadapayExcerciseTests
//
//  Created by Ahmer Hassan on 21/07/2022.
//

import XCTest
@testable import SadapayExcercise

class AppErrorTest: XCTestCase {

    let sut = AppError(error: "Something is missing")
    
    func test_AppError() {
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.error, "Something is missing")
        XCTAssertNotNil(AppError.generalError())
        XCTAssertEqual(AppError.generalError(), AppError(error: "some thing went wrong"))
    }
}
