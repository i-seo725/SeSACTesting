//
//  LoginTestCase.swift
//  SeSACTestingTests
//
//  Created by 이은서 on 12/11/23.
//

import XCTest
@testable import SeSACTesting   //해당 파일에 접근할 수 있게 임포트

final class LoginTestCase: XCTestCase {

    var sut: Validator!
    
    override func setUpWithError() throws {
        sut = Validator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testValidator_ValidEmail_ReturnTrue() throws {
        let user = User(email: "esun@a.com", password: "1234", check: "1234")
        let valid = sut.isValidEmail(email: user.email)
        XCTAssertTrue(valid, "@ 없거나 6글자 미만")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
