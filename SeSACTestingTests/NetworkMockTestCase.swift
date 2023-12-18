//
//  NetworkMockTestCase.swift
//  SeSACTestingTests
//
//  Created by 이은서 on 12/13/23.
//

import XCTest
@testable import SeSACTesting

// 테스트의 FIRST 원칙
//Fast(테스트가 빠르게 끝나야 함), Independent(독립적이어야 함), Repeat(반복적으로 같은 결과 도출), Self Validating(스스로 검증이 가능해야 함), Timely(시기 적절하게 구성)
final class NetworkMockTestCase: XCTestCase {
    //Test Double : 더미/목 데이터를 이용하는 테스트
    var sut: NetworkProvider!
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testExample() throws {
        sut.fetchLotto { Lotto in
            
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
