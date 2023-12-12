//
//  SeSACTestingTests.swift
//  SeSACTestingTests
//
//  Created by 이은서 on 12/8/23.
//

import XCTest
@testable import SeSACTesting


//LoginVC 내 valid 메서드 테스트

final class SeSACTestingTests: XCTestCase {

    var sut: LoginViewController!   //시스템이 테스트하려는 대상 가져오기(system under test)
    
    override func setUpWithError() throws {
        
        print(#function)
        //테스트 시작 전 값 세팅
        let sb = UIStoryboard(name: "Login", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        sut = vc
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        //테스트 이후 초기화(nil)
        print(#function)
        sut = nil
    }

    //하나의 테스트는 하나의 결과만 가져오게 하기
    func testLoginViewController_ValidEmail_ReturnTrue() throws {
        print(#function)
        sut.emailTextField.text = "test@test.com"
        
        XCTAssertTrue(sut.isValidEmail(), "@ 없거나 6글자 미만")
    }
    
    //테스트 결과가 실패가 되면 빌드 업로드가 되지 않음 => 성공으로 인식되게 해야 함
    func testLoginViewController_ValidEmail_ReturnFalse() throws {
        print(#function)
        sut.emailTextField.text = "testtest.com"
        
        XCTAssertFalse(sut.isValidEmail(), "@ 없거나 6글자 미만") //false가 떨어지면 성공
    }
    
    func testLoginViewController_Testing_ReturnNil() throws {
        sut.emailTextField = nil
        XCTAssertNil(sut.emailTextField, "NIL")
    }

    func testPerformanceExample() throws {
        print(#function)
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
