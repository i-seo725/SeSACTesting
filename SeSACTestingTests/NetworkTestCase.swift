//
//  NetworkTestCase.swift
//  SeSACTestingTests
//
//  Created by 이은서 on 12/13/23.
//

import XCTest
@testable import SeSACTesting

final class NetworkTestCase: XCTestCase {
//인스턴스를 넣지 않는 이유: 테스트 시마다 새로 인스턴스를 생성해야 독립적인 테스트가 가능
    var sut: NetworkManager!
    
    override func setUpWithError() throws {
        sut = NetworkManager.shared
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    
    //unittest는 동기 테스트에 최적화 되어 있음
    //비동기 테스트: expectation / fulfill / wait
    func testExample() throws {
        print("1")
        
        //어떤 기능을 수행할지 설명
        let promise = expectation(description: "Lotto number completion handler")
        
        sut.fetchLotto { lotto in
            print("2")
            print(lotto.bnusNo, lotto.drwNoDate, lotto.drwtNo1)
            
            var testNum = 100
            
            XCTAssertLessThanOrEqual(testNum, 45)
            XCTAssertGreaterThanOrEqual(testNum, 1)
            
            promise.fulfill()   //정의해둔 expectation이 충족되는 시점에 호출해서 동작을 수행했음을 알려줌
        }
        wait(for: [promise], timeout: 5)    //비동기 작업을 기다림, 타임아웃 시간 지나면 실패로 간주
        print("3")
    }

    func testPerformanceExample() throws {
    
        self.measure {
    
        }
    }

}
