//
//  LoanAppTests.swift
//  LoanAppTests
//
//  Created by Dongjun Lee on 11/10/24.
//

import XCTest
@testable import LoanApp

final class LoanAppTests: XCTestCase {

    func testCalculateAPRInvokesGetCreditScore() async throws {
        let expectation = XCTestExpectation(description: "APRService invokes Credit Score service.")
        var creditScoreService = MockedCreditScoreService()
        
        creditScoreService.onGetCreditScore = { ssn in
            expectation.fulfill()
            return 720
        }
        
        let aprService = APRService(creditScoreService: creditScoreService)
        let apr = try await aprService.calculateAPR(ssn: "235-23-2235")
        
        XCTAssertEqual(3.124, apr)
        
        let result = await XCTWaiter().fulfillment(of: [expectation], timeout: 5)
        XCTAssertEqual(result, .completed)
    }
    
    func testCalculateAPR() async throws {
        var creditScoreService = MockedCreditScoreService()
        
        creditScoreService.onGetCreditScore = { ssn in
            return 720
        }
        
        let aprService = APRService(creditScoreService: creditScoreService)
        let apr = try await aprService.calculateAPR(ssn: "234-45-3423")
        
        XCTAssertEqual(3.124, apr) // more like stub (there is no expectation)
    }
    
    func testThrowExceptionWhenCreditScoreNotFound() async throws {
        var creditScoreService = MockedCreditScoreService()
        creditScoreService.onGetCreditScore = { _ in
            return nil
        }
        
        
        do {
            let aprService = APRService(creditScoreService: creditScoreService)
            let apr = try await aprService.calculateAPR(ssn: "234-45-3423")
            XCTFail("Expected an error to be thrown, but received \(apr) instead.")
        } catch {
            XCTAssertEqual(CreditScoreError.noCreditScoreFound, error as? CreditScoreError)
        }
        
    }

}
